dataSource {
	pooled = true
	username = "sa"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost/transceo"
			username = "transceo"
			password = "transceo"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			driverClassName = "org.hsqldb.jdbcDriver"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			driverClassName = "org.hsqldb.jdbcDriver"
			url = "jdbc:hsqldb:file:prodDb;shutdown=true"
		}
	}
}