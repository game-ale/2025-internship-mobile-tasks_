🛜 Implement Network Info for Ecommerce App\

📌 ***Overview***

This task enhances the existing Ecommerce mobile app by adding network connectivity detection and integrating it into the product 

repository. The goal is to improve reliability by checking for network availability before performing remote operations.

✨ ***Features***
Implemented NetworkInfo and NetworkInfoImpl classes.

Integrated InternetConnectionChecker for real-time connection status.

Added network checks in the repository before fetching products.

Improved error handling for offline scenarios.

🛠️ **Implementation Details**

Created network_info.dart

Defined NetworkInfo (abstract class).

Implemented NetworkInfoImpl using InternetConnectionChecker.

Added isConnected getter to check connection status.

Repository Integration

Injected NetworkInfo into the product repository constructor.

Verified connectivity before making API calls.

Added error handling for no-network cases.