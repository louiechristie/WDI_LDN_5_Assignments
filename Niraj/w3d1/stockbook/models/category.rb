class Category < DBBase


attributes name: :string

def self.table_name
  :catergories
end

def initialize(params={})
  @id = params['id']
  @name = params['name']
end

  def portfolios
   results = run_sql("select * from portfolios where category_id = #{id}")
   results.map { |result| Portfolio.new(result)}
  end
  

end