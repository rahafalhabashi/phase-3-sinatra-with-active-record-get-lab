class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"
  get "/bakeries" do
    # we want to get a list of bakeries
    # return th bakeries as json array
    bakeries = Bakery.all
    bakeries.to_json
  end

  get "/bakeries/:id" do
    bakeries_by_id = Bakery.find(params[:id])
    bakeries_by_id.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json 
  end

  get "/baked_goods/most_expensive" do
    baked_goods = BakedGood.all.order(price: :desc).first
    baked_goods.to_json
  end
end
