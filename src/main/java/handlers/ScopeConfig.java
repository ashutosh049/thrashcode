package handlers;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.config.Scope;

public class ScopeConfig implements Scope {

	private Map<String, Object> objectMap = Collections.synchronizedMap(new HashMap<String, Object>());

	/**
	 * (non-Javadoc)
	 *
	 * @see org.springframework.beans.factory.config.Scope#get(java.lang.String,
	 *      org.springframework.beans.factory.ObjectFactory)
	 */
	public Object get(String name, ObjectFactory<?> objectFactory) {
		if (!objectMap.containsKey(name)) {
			objectMap.put(name, objectFactory.getObject());
		}
		return objectMap.get(name);

	}

	/**
	 * (non-Javadoc)
	 *
	 * @see org.springframework.beans.factory.config.Scope#remove(java.lang.String)
	 */
	public Object remove(String name) {
		return objectMap.remove(name);
	}

	/**
	 * (non-Javadoc)
	 *
	 * @see org.springframework.beans.factory.config.Scope#registerDestructionCallback
	 *      (java.lang.String, java.lang.Runnable)
	 */
	public void registerDestructionCallback(String name, Runnable callback) {
		// do nothing
	}

	/**
	 * (non-Javadoc)
	 *
	 * @see org.springframework.beans.factory.config.Scope#resolveContextualObject(java.lang.String)
	 */
	public Object resolveContextualObject(String key) {
		return null;
	}

	/**
	 * (non-Javadoc)
	 *
	 * @see org.springframework.beans.factory.config.Scope#getConversationId()
	 */
	public String getConversationId() {
		return "ScopeConfig";
	}

	/**
	 * clear the beans
	 */
	public void clearBean() {
		objectMap.clear();
	}
}
