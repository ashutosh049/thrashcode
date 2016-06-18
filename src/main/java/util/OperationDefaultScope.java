package util;

public interface OperationDefaultScope extends DefaultScope, MutableXScope {
	public abstract void clearValue(ValueKey valuekey);
}
