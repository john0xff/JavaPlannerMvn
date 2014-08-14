package demoapp;

import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.XMLConfiguration;

public class DatabaseConnection
{

	public static java.sql.Connection getConnection()
	{
		java.sql.Connection conn = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");

			XMLConfiguration config = null;
			try
			{
				config = new XMLConfiguration("config.xml");
			}
			catch (ConfigurationException e)
			{
				e.printStackTrace();
			}
			String url = "jdbc:mysql://" + config.getString("db.host") + "/" + config.getString("db.name");
			String user = config.getString("db.user");
			String password = config.getString("db.pass");
			conn = DriverManager.getConnection(url, user, password);
		}
		catch (ClassNotFoundException e1)
		{
			e1.printStackTrace();
		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		return conn;
	}

}
