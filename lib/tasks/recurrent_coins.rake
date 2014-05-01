namespace :recurrent_coins do
  desc "Update all chests with recurrent coins"
  task update_chests: :environment do
    Coin.recurrent.find_in_batches do |group|
      group.each do |coin|
        if (coin.updated_at + coin.period.days) >= Date.today
          if coin.repeat_until == Date.today
            coin.is_recurrent = false
          else
            new_coin = Coin.new
            new_coin.category = coin.category
            new_coin.chest = coin.chest
            new_coin.user = coin.user
            new_coin.value = coin.value
            new_coin.parent = coin
            new_coin.save
          end
          coin.updated_at = DateTime.now
          coin.save!
        end
      end
    end
  end

end
