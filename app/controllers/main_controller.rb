class ActionDispatch::Request::Session
	def init kvps
		kvps.to_a.each do |kvp| 
			@key = kvp[0]
			@val = kvp[1]
			if self[@key] == nil
				self[@key] = @val
			end
		end
	end
end

class MainController < ApplicationController

	def index
		session.init attempt: 0, word: "--------------"
		@attempt = session[:attempt]
		@word = session[:word]
	end

	def generate
		session[:attempt] += 1
		redirect_to '/'
		session[:word] = word 14
	end

	def clear
		session.clear
		redirect_to '/'
	end
	
end

def word length
	@chars = [*"A".ord.."Z".ord, *"0".ord.."9".ord]
	length.times.collect{ @chars[rand 36].chr }.join
end