require 'open-uri'
require 'nokogiri'
require 'date'
require 'active_support/time'

module Api
  module V1
    class WebhooksController < ApplicationController
      def index
        response = {'text' => "bad request!! The get method is not supported."}
        render json: response
      end

      # POST api/v1/webhooks
      def create
        logger.info params
        @webhook = Webhook.new(webhook_params)
        
        if @webhook.save
          response = {'text' => "I registered."}
        else
          response = {'text' => "An error occurred."}
          render json: response and return
        end

        # webhookの命令を実行する
        order = @webhook.text.split(" ")
        logger.info order
        if 'help' == order[1]
          response = {'text' => "次のコマンドが有効です。#{@webhook.trigger_word} help \n #{@webhook.trigger_word} post <url> \n "}
        elsif 'email' == order[1]
          ReportMailer.report_email.deliver
          response = {'text' => "I sent an e-mail"}
        elsif 'post' == order[1]
          url = order[2].delete('<').delete('>').chomp
          html = parse_html url
          if html.present?
            # タイトルを表示
            title = html.title

            day = Date.today
            @report = Report.find_by('deliver_date >= ?', day)
            if @report.nil?
              nextFriday = Time.current.beginning_of_week(:friday).since(1.week)
              @report = Report.new
              p nextFriday.to_date
              @report.deliver_date = nextFriday.to_date
              p @report.deliver_date
            end
            @article = @report.articles.build(:url => url, :title => title)
            if @article.save
              response = {'text' => "I registered #{title}"}
            else
              logger.error　@article.errors
              response = {'text' => "sorry! Registration failed!"}
            end
          else
            response = {'text' => "not url #{url}"}
          end
        else
          response = {'text' => "sorry!! unsported command. help=> #{@webhook.trigger_word} help"}
        end
        render json: response
      end

      private
      def webhook_params
        params.permit(:token, :team_id, :team_domain, :channel_id, :channel_name, :timestamp, :user_id, :user_name, :text, :trigger_word)
      end

      def parse_html(url)
        charset = nil
        begin
          html = open(url) do |f|
            charset = f.charset # 文字種別を取得
            f.read # htmlを読み込んで変数htmlに渡す
          end

          # htmlをパース(解析)してオブジェクトを生成
          return Nokogiri::HTML.parse(html, nil, charset)
        rescue => e
          logger.error e
          return nil
        end
      end
    end
  end
end