// orm.v implements the V language ORM: https://modules.vlang.io/orm.html

module vsql

import orm

/*
interface Connection {
	@select(config SelectConfig, data QueryData, where QueryData) ?[][]Primitive
	insert(table string, data QueryData) ?
	update(table string, data QueryData, where QueryData) ?
	delete(table string, where QueryData) ?
	create(table string, fields []TableField) ?
	drop(table string) ?
	last_id() Primitive
}
*/

pub fn (c &Connection) @select(config orm.SelectConfig, data orm.QueryData, where orm.QueryData) ?[][]orm.Primitive {
	panic('select')
}

pub fn (c &Connection) insert(table string, data orm.QueryData) ? {
	panic('insert')
}

pub fn (c &Connection) update(table string, data orm.QueryData, where orm.QueryData) ? {
	panic('update')
}

pub fn (c &Connection) delete(table string, where orm.QueryData) ? {
	panic('delete')
}

pub fn (c &Connection) create(table string, fields []orm.TableField) ? {
	panic('create')
}

pub fn (c &Connection) drop(table string) ? {
	panic('drop')
}

pub fn (c &Connection) last_id() orm.Primitive {
	panic('last_id')
}
