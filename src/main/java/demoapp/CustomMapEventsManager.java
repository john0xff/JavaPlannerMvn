package demoapp;

import javax.servlet.http.HttpServletRequest;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEventsManager;
import com.dhtmlx.planner.DHXStatus;
import com.mysql.jdbc.Statement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class CustomMapEventsManager extends DHXEventsManager
{

	public CustomMapEventsManager(HttpServletRequest request)
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

			String query = "SELECT event_id, text, start_date, end_date, event_location, lng, lat FROM events_map";
			ResultSet resultset = statement.executeQuery(query);

			while (resultset.next())
			{
				EventMap e = new EventMap();
				e.setId(Integer.parseInt(resultset.getString("event_id")));
				e.setText(resultset.getString("text"));
				e.setStart_date(resultset.getString("start_date"));
				e.setEnd_date(resultset.getString("end_date"));
				e.setEvent_location(resultset.getString("event_location"));
				e.setLat(resultset.getString("lat"));
				e.setLng(resultset.getString("lng"));

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

		EventMap e = (EventMap) event;
		try
		{
			String query = null;
			String start_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(e.getStart_date());
			String end_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(e.getEnd_date());
			if (status == DHXStatus.UPDATE)
			{
				query = "UPDATE events_map SET text=?, start_date=?, end_date=?, event_location=?, lat=?, lng=? WHERE event_id=?";
				ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, e.getText());
				ps.setString(2, start_date);
				ps.setString(3, end_date);
				ps.setString(4, e.getEvent_location());
				ps.setString(5, e.getLat());
				ps.setString(6, e.getLng());
				ps.setInt(7, e.getId());

			}
			else if (status == DHXStatus.INSERT)
			{
				query = "INSERT INTO events_rec (event_id, text, start_date, end_date, event_location, lat, lng) VALUES (null, ?, ?, ?, ?, ?, ?)";
				ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, e.getText());
				ps.setString(2, start_date);
				ps.setString(3, end_date);
				ps.setString(4, e.getEvent_location());
				ps.setString(5, e.getLat());
				ps.setString(6, e.getLng());

			}
			else if (status == DHXStatus.DELETE)
			{
				query = "DELETE FROM events_rec WHERE event_id=? LIMIT 1";
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

			/**
			 * we should delete all sub-events from series
			 * http://docs.dhtmlx.com/doku.php?id=dhtmlxscheduler:recurring_events
			 * #editing_deleting_a_certain_occurrence_in_the_series
			 */
			if (status == DHXStatus.DELETE)
			{
				query = "DELETE FROM events_rec WHERE event_pid=? LIMIT 1";
				ps = conn.prepareStatement(query);
				ps.setInt(1, event.getId());
				ps.executeUpdate();
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
		return new EventMap();
	}
}
