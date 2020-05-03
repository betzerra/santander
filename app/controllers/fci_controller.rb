class FciController < ApplicationController
  def all
    @time = Time.now
    @list = FciHelper.fetch
  end

  def detail
  end
end
