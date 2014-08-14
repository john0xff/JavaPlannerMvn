package demoapp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEventsManager;
import com.dhtmlx.planner.DHXStatus;
import com.dhtmlx.planner.data.DHXCollection;
import com.mysql.jdbc.Statement;

public class CustomUnitsEventsManager extends DHXEventsManager
{

	public CustomUnitsEventsManager(HttpServletRequest request)
	{
		super(request);
	}

	public Iterable<DHXEv> getEvents()
	{
		DHXEventsManager.date_format = "yyyy-MM-dd HH:mm:ss";
		List<DHXEv> evs = new ArrayList<DHXEv>();
		try
		{
			java.sql.Connection conn = DatabaseConnection.getConnection();
			java.sql.Statement statement = conn.createStatement();

			String query = "SELECT event_id, text, start_date, end_date, event_topic FROM events_units";
			ResultSet resultset = statement.executeQuery(query);

			while (resultset.next())
			{
				EventUnits e = new EventUnits();
				e.setId(Integer.parseInt(resultset.getString("event_id")));
				e.setText(resultset.getString("text"));
				e.setStart_date(resultset.getString("start_date"));
				e.setEnd_date(resultset.getString("end_date"));
				e.setEvent_topic(resultset.getString("event_topic"));

				evs.add(e);
			}
			conn.close();
		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		DHXEventsManager.date_format = "MM/dd/yyyy HH:mm";

		return evs;
	}

	@Override
	public DHXStatus saveEvent(DHXEv event, DHXStatus status)
	{
		java.sql.Connection conn = DatabaseConnection.getConnection();
		java.sql.PreparedStatement ps = null;
		java.sql.ResultSet result = null;

		EventUnits e = (EventUnits) event;
		try
		{
			String query = null;
			String start_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(e.getStart_date());
			String end_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(e.getEnd_date());
			if (status == DHXStatus.UPDATE)
			{
				query = "UPDATE events_units SET text=?, start_date=?, end_date=?, event_topic=? WHERE event_id=?";
				ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, e.getText());
				ps.setString(2, start_date);
				ps.setString(3, end_date);
				ps.setString(4, e.getEvent_topic());
				ps.setInt(7, e.getId());

			}
			else if (status == DHXStatus.INSERT)
			{
				query = "INSERT INTO events_units (event_id, text, start_date, end_date, rec_type) VALUES (null, ?, ?, ?, ?)";
				ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, e.getText());
				ps.setString(2, start_date);
				ps.setString(3, end_date);
				ps.setString(4, e.getEvent_topic());

			}
			else if (status == DHXStatus.DELETE)
			{
				query = "DELETE FROM events_units WHERE event_id=? LIMIT 1";
				ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
				ps.setInt(1, event.getId());
			}

			if (ps != null)
			{
				ps.executeUpdate();
				result = ps.getGeneratedKeys();
				if (result.next())
				{
					event.setId(result.getInt(1));
				}
			}

		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		finally
		{
			if (result != null)
				try
				{
					result.close();
				}
				catch (SQLException e1)
				{
				}
			if (ps != null)
				try
				{
					ps.close();
				}
				catch (SQLException e1)
				{
				}
			if (conn != null)
				try
				{
					conn.close();
				}
				catch (SQLException e1)
				{
				}
		}

		return status;
	}

	@Override
	public DHXEv createEvent(String id, DHXStatus status)
	{
		return new EventUnits();
	}

	@Override
	public HashMap<String, Iterable<DHXCollection>> getCollections()
	{
		ArrayList<DHXCollection> event_topic = new ArrayList<DHXCollection>();
		event_topic.add(new DHXCollection("mobile", "Mobile"));
		event_topic.add(new DHXCollection("web", "Web design"));
		event_topic.add(new DHXCollection("marketing", "Marketing"));

		HashMap<String, Iterable<DHXCollection>> c = new HashMap<String, Iterable<DHXCollection>>();
		c.put("event_topic", event_topic);
		return c;
	}
}
