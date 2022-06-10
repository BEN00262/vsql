import os
import vsql
import orm

fn main() {
	os.rm('test.vsql') or {}
	example() or { panic(err) }
}

struct Product {
	id int [primary]
    product_name   string    [sql: 'varchar(100)']
    price f32
}

fn example() ? {
	mut db := *(vsql.open('test.vsql') ?)

	// if db is orm.Connection {
	// }

	sql db {
		create table Product
	}

	products := [
		Product{
			id: 1
			product_name: 'Ice Cream'
			price: 5.99
		}
		Product{
			id: 2
			product_name: 'Ham Sandwhich'
			price: 3.47
		}
		Product{
			id: 3
			product_name: 'Bagel'
			price: 1.25
		}
	]

	for product in products {
		sql db {
			insert product into Product
		}
	}

	result := sql db {
		select from Product where price > 2
	}

	for row in result {
		println(row)
	}
}
