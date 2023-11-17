package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sessions.VehiculeFacade;

import java.io.IOException;

import entities.Vehicule;

/**
 * Servlet implementation class VehiculeController
 */
public class VehiculeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
	private VehiculeFacade facade;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehiculeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String matricule = request.getParameter("matricule");
		Vehicule  v = new Vehicule();
		v.setMatricule(matricule);
		
		facade.create(v);
		
		RequestDispatcher  dispatcher = request.getRequestDispatcher("vehicules.jsp");
		request.setAttribute("vehicules", facade.findAll());
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
