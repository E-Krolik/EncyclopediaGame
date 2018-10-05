module Tools


class Team
	attr_accessor :team_name,:players,:answer,:round_score,:game_score
	def initialize(team_name,players)
		@team_name = team_name
		@players = players
		@answer = ""
		@round_score = 0
		@game_score = 0
		@d = ""
	end
	def round_win
		@round_score +=1
	end
	def game_win
		@game_score +=1
	end
	def win
		puts @team_name + "  Your team wins , good job !!!!!"
		for player in @players
			puts "Congratulations :  " + player + "!!!"
		end
	end

 end


def create_teams_array(teams_amount)
	team_array = []
	for team in 0..(teams_amount-1)
		print (team+1).to_s + " team - Enter players amount : "
				players_amount = gets.chomp.to_i
				players_array = []
					for player in 1..players_amount
						print "Enter " + player.to_s + " player name : "
						player_name = gets.chomp
						players_array.push(player_name)
					end
		print "Enter the team name : "
				team_name = gets.chomp
		team_array[team] = Team.new(team_name,players_array)
	end
	return team_array
end


def ident
	for n in 0..65
		print "\n"
	end
 end


	# 5.1 перемешать копию массива  команд и создать хэш таблицу которая присваивает букве эллемет массива (в Tool)
def shuffle_team_array_and_create_hash(team_array,real_deffinition)
	 team_array_copy = team_array.sort_by{rand}
	 alphabet = ("a".."z").to_a
	 number_of_real_def = rand(1..team_array_copy.size)
	 team_number = 0
	 answer_hash = Hash.new
	 for team in team_array_copy
	 	team_number += 1
	 	if team_number == number_of_real_def
	 		answer_hash[alphabet[team_number - 1]] = real_deffinition
	 		team_number += 1
	 		answer_hash[alphabet[team_number - 1]] = team
	 	else
	 		answer_hash[alphabet[team_number - 1]] = team
	 	end
	 end
return answer_hash
end


# 5.2 выбрать рандомный индекс (в Tool + 2 пункта снизу вместе)
	# 5.3 сохранить в переменную "variants_table" ответы команд от 0..рандомного индекса(учитывать переход на новую строку)
	# 5.4	сохранить в переменную "variants_table" настоящее определение и оставшуюся часть массива   


def create_answer_table(answer_hash)
	 alphabet = ("a".."z").to_a
	 answer_table = ""
	 for i in 0..(answer_hash.size-1)
	 	if answer_hash[alphabet[i]].class == String
	 	answer_table = answer_table + "\n" + "(" +  alphabet[i] + ")  " + answer_hash[alphabet[i]]
	 	else
	 	answer_table = answer_table + "\n" + "(" +  alphabet[i] + ")  " + answer_hash[alphabet[i]].answer
	 	end
	 end
return answer_table
end


=begin
	7.1 найти максимальный результат в массиве команд (проверить условия : если результаты нулевые , если есть несколько команд набравших максимум)
		7.1.1 создать пустой массив победители раунда
		7.1.2 установить начальное значение максимума единицей
		7.1.3 после нахождения каждого максимального в массив победителей обнуляется и в него добавляется команда из массива комнад , если 
	    максимальный результат равен входному результату , то в массив победителей добавляется комада 
	    7.1.4 если максимальный больше нуля , то командам в массиве победителей добавить +1 к game_score  и вывести как победителей раунда ,  если нет сказать ,что все проиграли.
=end

def count_round_results(teams_array)
	round_winners = []
	maximum = 1
	for team in teams_array
		if team.round_score > maximum
			round_winners = []
			round_winners.push(team)
		elsif team.round_score == maximum
			round_winners.push(team)
		end
	end
if round_winners.empty?
	puts " No winners in this round "
else
	for team in round_winners
		puts team.team_name + " win this round "
		team.game_win
	end
end
end


def count_game_results(teams_array)
	game_winners = []
	maximum = 1
	for team in teams_array
		if team.game_score > maximum
			game_winners = []
			game_winners.push(team)
		elsif team.game_score == maximum
			game_winners.push(team)
		end
	end

if game_winners.empty?
	puts " No winners in this game "
else
	for team in game_winners
		puts team.team_name + " win this game !!!! "
		team.win
	end
end
end



end