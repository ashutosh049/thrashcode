package util;

public final class ValueKey implements Comparable {

	private Class _valueClass;
	private String _name;

	public ValueKey(Class argClass, String argName) {
		_valueClass = argClass;
		_name = argName;
	}

	public int compareTo(ValueKey argO) {
		return getName().compareTo(argO.getName());
	}

	public boolean equals(Object argObj) {
		if (argObj == null)
			return false;
		if (!(argObj instanceof ValueKey))
			return false;
		ValueKey other = (ValueKey) argObj;
		if (getName() == null)
			return other.getName() == null;
		else
			return getName().equals(other.getName());
	}

	public String getName() {
		return _name;
	}

	public Class getValueClass() {
		return _valueClass;
	}

	public int hashCode() {
		return _name.hashCode();
	}

	public String toString() {
		return (new StringBuilder()).append("ValueKey [").append(_name)
				.append("]<").append(_valueClass).append(">").toString();
	}

	public int compareTo(Object x0) {
		return compareTo((ValueKey) x0);
	}
}
