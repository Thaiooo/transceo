import javax.swing.plaf.basic.BasicInternalFrameTitlePane.ShowSystemMenuAction;

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
			// one of 'create', 'create-drop','update'
			dbCreate = "create-drop" 
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost/transceo"
			username = "transceo"
			password = "transceo"
			loggingSql = false
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