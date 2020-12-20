def show
  @search = Search.new unless params[:query]
  @search = Search.new(params[:query])
end
