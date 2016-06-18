package util;

import org.springframework.beans.factory.annotation.Autowired;
import javax.inject.Inject;
import javax.inject.Provider;

public class Operation {
	
	@Inject
	private OperationDefaultScope _defaultScope;
	
	protected void clearScopedValue(ValueKey argValueKey) {
		_defaultScope.clearValue(argValueKey);
	}
	protected Object getScopedValue(ValueKey argValueKey) {
		return _defaultScope.getValue(argValueKey);
	}
	protected void setScopedValue(ValueKey argValueKey, Object argValue) {
		_defaultScope.setValue(argValueKey, argValue);
	}

}
