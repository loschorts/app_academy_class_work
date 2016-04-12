module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end
  def tag_list=(tags_string)

end
end
