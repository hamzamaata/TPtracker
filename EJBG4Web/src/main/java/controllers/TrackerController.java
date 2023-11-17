package controllers;

import entities.Tracker;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sessions.TrackerFacade;

import java.io.IOException;
import java.util.List;

@WebServlet("/TrackerController")
public class TrackerController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private TrackerFacade trackerFacade;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String simNumber = request.getParameter("simNumber");
        Tracker tracker = new Tracker();
        tracker.setSimNumber(simNumber);
        trackerFacade.create(tracker);

        doGet(request, response); 
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Tracker> trackers = trackerFacade.findAll();
        request.setAttribute("trackers", trackers);

        String operation = request.getParameter("operation");
        if (operation != null) {
            if (operation.equals("delete")) {
                String trackerId = request.getParameter("id");
                if (trackerId != null) {
                    int id = Integer.parseInt(trackerId);
                    Tracker tracker = trackerFacade.find(id);
                    if (tracker != null) {
                        trackerFacade.remove(tracker);
                    }
                }
            } else if (operation.equals("edit")) {
                String trackerId = request.getParameter("id");
                if (trackerId != null) {
                    int id = Integer.parseInt(trackerId);
                    Tracker tracker = trackerFacade.find(id);
                    if (tracker != null) {
                        request.setAttribute("editTracker", tracker);
                    }
                }
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("tracker.jsp");
        dispatcher.forward(request, response);
    }
}