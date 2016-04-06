package hrs.common.resolver;

import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import hrs.common.common.CommandMap;

/* author : GeoKim
 * request session 에 담겨있는 파라미터 value 들을 자동으로 추가 및 삭제가 가능한 클래스, 
 * 아마도 정상적으로 작동한다면 추가하거나 수정할 이유는 없을듯
 */
public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest,
			WebDataBinderFactory binderFactory) throws Exception {
		
		CommandMap commandMap = new CommandMap();
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		Enumeration<?> enumeration = request.getParameterNames();
		
		String key = null;
        String[] values = null;
        while(enumeration.hasMoreElements()){
            key = (String) enumeration.nextElement();
            values = request.getParameterValues(key);
            if(values != null){
                commandMap.put(key, (values.length > 1) ? values:values[0] );
            }
        }
        return commandMap;
	}

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}

}
