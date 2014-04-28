namespace :recurrent_coins do
  desc "Update all chests with recurrent coins"
  task update_chests: :environment do
    Coin.find_in_batches(conditions: { is_recurrent: true } ) do |group|
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
            new_coin.save
          end
          coin.updated_at = Date.today
          coin.save!
        end
      end
    end
  end

end
