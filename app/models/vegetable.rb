class Vegetable < ActiveRecord::Base

  @date = Time.now.yday()
  @winter_veg_date = @date + 365

 def self.ripe_vegetables
   ripe_vegetables = []

   Vegetable.all.each do |vegetable|
     if (vegetable.start_day..vegetable.end_day).include?(@date) || (vegetable.start_day..vegetable.end_day).include?(@winter_veg_date)
       ripe_vegetables << vegetable
     end
   end
   ripe_vegetables
 end

 def self.not_ripe_vegetables
   date = Time.now.yday()
   not_ripe_vegetables = []
   Vegetable.all.each do |vegetable|
     if !(vegetable.start_day..vegetable.end_day).include?(@date || @winter_veg_date)
       not_ripe_vegetables << vegetable
     end
   end
   not_ripe_vegetables
 end

 def self.get_col_size(ripe)
   if ripe.length == 1
     col_size = 6
   elsif ripe.length == 3
     col_size = 3
   elsif ripe.length == 4
     col_size = 3
   elsif ripe.length == [5..6]
     col_size = 4
   elsif ripe.length == [7..12]
     col_size = 3
   else ripe.length == [12..50]
     col_size = 2
   end
   col_size
 end
end
