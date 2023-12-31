module PostsHelper
  # ハッシュタグ（# または ＃ で始まる単語）をリンクに変換する
  def render_with_hashtags(caption)
      caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) do |word|
      link_to word, "/searches/search?q=#{CGI.escape(word[1..-1])}"
      end.html_safe
  end 
end
