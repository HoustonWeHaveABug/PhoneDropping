class String
	def is_integer?
		self.to_i.to_s == self
	end
end

def usage
	STDERR.puts "Program arguments"
	STDERR.puts "- Drops worst case: phones floors"
	STDERR.puts "- Phones optimal: floors"
	STDERR.flush
end

def binomial(drops, phones, floors)
	sum = 0
	c = 1
	for n in 1..phones
		c *= drops+1-n
		c /= n
		sum += c
		if sum > floors || n == drops
			break
		end
	end
	return sum, n
end

def drops_worst_case(phones, floors)
	if phones < 1 || floors < 1
		return 0, 0
	end
	hi = floors
	lo = 0
	n = phones
	while hi-lo > 1
		mid = lo+(hi-lo)/2
		sum, n = binomial(mid, phones, floors)
		if sum < floors
			lo = mid
		else
			hi = mid
		end
	end
	return lo+1, n
end

def phones_optimal(floors)
	if floors < 1
		return 0
	end
	drops, hi = drops_worst_case(floors, floors)
	lo = 0
	while hi-lo > 1
		mid = lo+(hi-lo)/2
		sum = drops_worst_case(mid, floors)[0]
		if sum > drops
			lo = mid
		else
			hi = mid
		end
	end
	while drops_worst_case(lo, floors)[0] == drops
		lo -= 1
	end
	lo+1
end

if ARGV.size == 1
	if !ARGV[0].is_integer?
		usage
		exit false
	end
	puts "Phones optimal #{phones_optimal(ARGV[0].to_i)}"
	STDOUT.flush
elsif ARGV.size == 2
	if !ARGV[0].is_integer? || !ARGV[1].is_integer?
		usage
		exit false
	end
	puts "Drops worst case #{drops_worst_case(ARGV[0].to_i, ARGV[1].to_i)[0]}"
	STDOUT.flush
else
	usage
	exit false
end
