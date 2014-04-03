def menu
	puts 'clear'
	puts "Welcome to Building Manager v.02 (BETA)"
	puts "1: List Flats"
	puts "2: List Prospects"
	puts "3: Let a Flat"
	puts "4: Evict a TenantX"
	puts "5: List Empty FlatsA"
	puts "6: List TenantsX"
	puts "7: Create a Prospect"
	puts "q; Quit Program"
	print '---->'
	gets.chomp
end
=begin

=end

def let_flat(building) #pass the building into this method
	print 'Which flat?'
	print "(#{building.list_empty_flats})"
	flat_name = gets.chomp
	print 'Which prospect?'
	#print "(#{prospect.list_empty_flats})"
	prospect_name = gets.chomp.downcase



	prospect = building.prospects.delete(prospect_name)
	flat = building.flats[flat_name]

	if prospect && flat && flat.vacant?
		flat.tenants[prospect.name] = prospect
		puts "You have placed #{prospect_name} into #{flat_name}."
	else
		puts "Either flat or prospect is invalid"
	end
end