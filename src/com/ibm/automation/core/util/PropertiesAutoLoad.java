package com.ibm.automation.core.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.configuration.reloading.FileChangedReloadingStrategy;


/**
 * 
 * 配置文件properties自动加载类
 * @author lyh
 * @version 2012-6-5
 * @see PropertiesAutoLoad
 * @since
 */
public class PropertiesAutoLoad
{

    /**
     * Singleton
     */
    private static final PropertiesAutoLoad AUTO_LOAD = new PropertiesAutoLoad();

    /**
     * Configuration
     */
    private static PropertiesConfiguration propConfig;

    /**
     * 自动保存
     */
    private static boolean autoSave = true;

    /**
     * properties文件路径
     * @param propertiesFile
     * @return 
     * @see
     */
    public static PropertiesAutoLoad getInstance(String propertiesFile)
    {
        //执行初始化
        init(propertiesFile);

        return AUTO_LOAD;
    }

    /**
     * 根据Key获得对应的value
     * @param key
     * @return 
     * @see
     */
    public Object getValueFromPropFile(String key)
    {
        return propConfig.getProperty(key);
    }

    public List<String> getKeys(){
    	List<String> allkeys = new ArrayList<String>();
    	Iterator it = propConfig.getKeys();
    	while(it.hasNext()){
    		allkeys.add((String)it.next());
    	}
    	return allkeys;
    }
    /**
     * 获得对应的value数组
     * @param key
     * @return 
     * @see
     */
    public String[] getArrayFromPropFile(String key)
    {
        return propConfig.getStringArray(key);
    }

    /**
     * 设置属性
     * @param key
     * @param value 
     * @throws ConfigurationException 
     * @see
     */
    public void setProperty(String key, String value) throws ConfigurationException
    {
        propConfig.setProperty(key, value);
    }

    /**
     * 设置属性
     * @param map 
     * @see
     */
    public void setProperty(Map<String, String> map)
    {
        for (String key : map.keySet())
        {
            propConfig.setProperty(key, map.get(key));
        }
    }

    /**
     * 构造器私有化
     */
    private PropertiesAutoLoad()
    {

    }

    /**
     * 初始化
     * @param propertiesFile 
     * @see
     */
    private static void init(String propertiesFile)
    {
        try
        {
            propConfig = new PropertiesConfiguration(propertiesFile);

            //自动重新加载
            propConfig.setReloadingStrategy(new FileChangedReloadingStrategy());

            //自动保存
            propConfig.setAutoSave(autoSave);
        }
        catch (ConfigurationException e)
        {
          System.out.println(e.getMessage());
        }
    }

    /**
     * Test
     * @param args 
     * @throws ConfigurationException 
     * @see
     */
    public static void main(String[] args) throws ConfigurationException
    {
    	PropertiesAutoLoad pa = PropertiesAutoLoad.getInstance("C:/remoteCommand.properties");
    	
    	//pa.setProperty("msg", "msg_test");
    	
		String temp =  (String)pa.getValueFromPropFile("msg");
		
		System.out.println(temp);
        

    }

}

