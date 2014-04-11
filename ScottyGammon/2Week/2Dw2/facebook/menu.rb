def menu
	system "clear" or system "cls"
	puts "WDI Facebook Database"
	puts "C: Create a Friend"
	puts "R: Read Friends"
	puts "U: Update a Friend"
	puts "D: Delete a Friend"
	puts "q; Quit Program"
	print '---->'
	gets.chomp
end

=begin
def let_flat(building) #pass the building into this method
	print 'Which flat?'
	print "(#{building.list_empty_flats})"
	flat_name = gets.chomp
	print 'Which prospect?'
	print "(#{building.list_prospects})"
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

def evict_tenant(building) #this breaks with my new code a final and i do not know why.
    print 'Which tenant? '
    print "(#{building.list_tenants}) "
    tenant_name = gets.chomp
  tenant = tenants.delete(tenant_name) if flat
  if tenant
    puts "#{building.tenant_name} has been evicted."
  else
    "Sorry, there seems to be a problem evicting, please check your inputs and try again."    
  end
end
=end

