package util;

public abstract class AbstractWorker{

	private DefaultScope _defaultScope;

	protected Object getScopedValue(ValueKey argValueKey) {
		return _defaultScope.getValue(argValueKey);
	}
}
