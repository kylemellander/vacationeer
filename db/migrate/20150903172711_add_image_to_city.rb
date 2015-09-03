class AddImageToCity < ActiveRecord::Migration
  def change
    add_column(:cities, :img, :string, default: "http://4vector.com/i/free-vector-rgesthuizen-city-skyline-clip-art_111543_Rgesthuizen_City_Skyline_clip_art_hight.png")
  end
end
