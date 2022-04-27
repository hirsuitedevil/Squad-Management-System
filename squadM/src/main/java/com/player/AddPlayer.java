package com.player;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddPlayer
 */
@SuppressWarnings("serial")
@WebServlet("/AddPlayer")
public class AddPlayer extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Random rand = new Random();
		int PlayerNumber = rand.nextInt(900000) + 100000 ;
		HttpSession hs = request.getSession();
		String team_id = request.getParameter("teamid");
		String playername = request.getParameter("playername");
		String role = request.getParameter("role");
		String runs = request.getParameter("runs");
		String batsr = request.getParameter("batsr");
		String centuries = request.getParameter("centuries");
		String bowlsr = request.getParameter("bowlsr");
		String economy = request.getParameter("economy");
		String wickets = request.getParameter("wickets");
		String isCap = request.getParameter("isCap");
		int player_capacity=0;
		int addPlayer = 0;
		int count = 0;
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			ResultSet total_player_result= statement.executeQuery("select * from tblplayercapacity");
			if(total_player_result.next()){
				player_capacity = total_player_result.getInt(1);
			}
			ResultSet resultSet = statement.executeQuery("select count(*) from tblplayer");
			if (resultSet.next()) {
				count = resultSet.getInt(1);
			}
			if (player_capacity > count) {
				int cap;
				if(isCap=="No" || isCap=="no" || isCap=="NO") {
				 cap=0;
				}
				else {
					 cap=1;
				}
				addPlayer = statement.executeUpdate(
						"insert into tblPlayer(PlayerNumber,TeamID,PlayerName,Role,Runs,BatSR,Centuries,BowlSR,Economy,Wickets,IsCap)values('"
								+ PlayerNumber  + "','" + team_id + "','" + playername + "','"
								+ role + "','" + runs + "','"+ batsr + "','" + centuries + "','"+ bowlsr + "','"+ economy + "','" + wickets + "','"+ cap +"')");
			} else {
				String message="Pool is full, Wait for sometime";
				hs.setAttribute("message", message);
				response.sendRedirect("add-player.jsp");
			}
			if (addPlayer > 0) {
				response.sendRedirect("add-player.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
