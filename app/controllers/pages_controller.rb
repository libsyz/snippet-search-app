class PagesController < ApplicationController
  def search
    fetch_snippets if params[:query].present?
  end

  def fetch_snippets
    @query = params[:query]
    @snippets = Snippet.global_search(@query)
  end
end


