class ChatbotsController < ApplicationController
  protect_from_forgery

  def create
    input = params[:input]
    client = OpenAI::Client.new(access_token: ENV["OPENAI_ACCESS_TOKEN"])
    # .envのアクセスキーを参照
    
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        
        # max_tokensで回答の文字数の制限をしている
        messages: [
          { role: "system", content: "You are a helpful assistant. response to japanese" },
          { role: "user", content: input },
        ],
        temperature: 0.7,
        max_tokens: 1000,
      },
    )
    
    respond_to do |format|
      format.json { render json: { response: response.dig("choices", 0, "message", "content") } }
    end
    
  end
  
end
