package cn.slkj.cdtaxt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.slkj.cdtaxt.entity.User;
import cn.slkj.slUtil.Const;

public class LoginHandlerInterceptor extends HandlerInterceptorAdapter {
	public String[] allowUrls;// 还没发现可以直接配置不拦截的资源，所以在代码里面来排除

	@Autowired

	public void setAllowUrls(String[] allowUrls) {
		this.allowUrls = allowUrls;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");
		if (null != allowUrls && allowUrls.length >= 1)
			for (String url : allowUrls) {
				if (requestUrl.contains(url)) {
					return true;
				}
			}
//		String path = request.getServletPath();
//		if (path.matches(Const.NO_INTERCEPTOR_PATH) || path.isEmpty()) {
//			return true;
//		}
		User user = (User) request.getSession().getAttribute(Const.SESSION_USER);
		
		if (user != null) {
			return true; // 返回true，则这个方面调用后会接着调用postHandle(), afterCompletion()
		} else {
			/**
			 * 如果无法忍受每次都抛出异常时，可以使用此方法进行页面跳转
			 */
			// 未登录 跳转到登录页面
			throw new SessionTimeoutException();// 返回到配置文件中定义的路径
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
	}

}
