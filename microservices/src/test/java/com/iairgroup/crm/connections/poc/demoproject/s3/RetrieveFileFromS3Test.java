package com.iairgroup.crm-connections.poc.demoproject.s3;

import org.powermock.modules.junit4.PowerMockRunner;
import java.io.IOException;
import org.junit.Before;
import org.mockito.MockitoAnnotations;

/**
 * Purpose - This class is used to test RetrieveFileFromS3 class, with all the possible scenarios.
 *
 * @author Your_Full_Name (Your_Bsafe)
 *
 */
@RunWith(PowerMockRunner.class)
public class RetrieveFileFromS3Test {

    /**
     * Method to perform the initial setup required by the test
     */
    @Before
    public void setUp() throws IOException {
        MockitoAnnotations.initMocks(this);
    }

}