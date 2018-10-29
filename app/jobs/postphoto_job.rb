class PostphotoJob < ApplicationJob
  queue_as :default

  def perform(product)
    product.save
  end
end
