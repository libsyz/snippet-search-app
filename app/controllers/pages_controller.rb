class PagesController < ApplicationController
  def search
    if params[:query].present?
      @query = params[:query]
      @snippets = Snippet.global_search(@query)

    end
  end
end
