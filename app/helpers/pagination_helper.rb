module PaginationHelper
  def do_paginate(data, page, number = 10)
    data.paginate(page: page, per_page: number)
  end
end