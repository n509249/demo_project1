package com.iairgroup.crm-connections.poc.demoproject.handler;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.iairgroup.microservices.framework.utilities.dynamodbutility.ConfigurationUtility;
import com.amazonaws.services.lambda.runtime.events.S3Event;
import com.iairgroup.crm-connections.poc.demoproject.utilities.DemoprojectConstants;

/**
 * This is the java handler class for DemoprojectHandler
 *
 * @author Your_Full_Name (Your_Bsafe)
 */
public class DemoprojectHandler implements RequestHandler<S3Event, Object> {

    private static final AnnotationConfigApplicationContext CTX =
        new AnnotationConfigApplicationContext(DemoprojectConstants.BASE_PACKAGE);

    /**
    * Constructor created to enable auto wiring of beans, this will scan all the annotations present within
    * the package so that spring annotations can be used and no need to create a new instance each time.
    * <p>
    * This will also call load the configuration and error table data in cache.
    */
    public DemoprojectHandler() {
        CTX.getAutowireCapableBeanFactory().autowireBean(this);

        /*
        This method in called to load all the data in configuration table, error code table
        and error text table shall be store in cache.
         */
        ConfigurationUtility.getInstance().loadConfigAndErrorTableData();
    }

    /**
    * ADVICE: USE THE Logger class for logging entering and exit time.
    *
    * Logger LOGGER = LoggerFactory.getLogger(DemoprojectHandler.class);
    */
    @Override
    public Object handleRequest(S3Event s3Event, Context context) {

        /*
         * Entry point method for the lambda function which will be triggered from the s3
         *
         */

        return null;
    }

}
