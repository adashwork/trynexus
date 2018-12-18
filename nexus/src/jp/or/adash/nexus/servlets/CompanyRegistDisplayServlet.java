package jp.or.adash.nexus.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.or.adash.nexus.entity.Job;
import jp.or.adash.nexus.entity.JobCategory;
import jp.or.adash.nexus.entity.Staff;
import jp.or.adash.nexus.entity.Todouhuken;
import jp.or.adash.nexus.services.JobCategoryService;
import jp.or.adash.nexus.services.JobService;
import jp.or.adash.nexus.services.TodouhukenService;

/**
 * Servlet implementation class CompanyRegistDisplayServlet
 */
@WebServlet("/web/company-registdisp")
public class CompanyRegistDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CompanyRegistDisplayServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		Staff staff = (Staff) session.getAttribute("UserData");

		// 1.都道府県リストを取得する
		TodouhukenService Tservice = new TodouhukenService();
		List<Todouhuken> Tlist = Tservice.getTodouhukenList();
		// 2.都道府県リストをリクエストに格納する
		request.setAttribute("Todouhukenlist", Tlist);

		// 1.職種大分類リストを取得する
		JobService Lservice = new JobService();
		List<Job> Llist = Lservice.getLargeJobList();
		// 2.職種大分類リストをリクエストに格納する
		request.setAttribute("Largelist", Llist);

		// 1.業種大分類リストを取得する
		JobCategoryService JCLservice = new JobCategoryService();
		List<JobCategory> JCLlist = JCLservice.getLargeJobCategoryList();
		// 2.業種大分類リストをリクエストに格納する
		request.setAttribute("JCLargelist", JCLlist);


		request.setAttribute("Staff", staff);
		request.getRequestDispatcher("/companyregist.jsp")
				.forward(request, response);

	}

}
