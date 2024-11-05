import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'management_model.dart';
export 'management_model.dart';

class ManagementWidget extends StatefulWidget {
  const ManagementWidget({super.key});

  @override
  State<ManagementWidget> createState() => _ManagementWidgetState();
}

class _ManagementWidgetState extends State<ManagementWidget> {
  late ManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> _items = [
    {
      'question':
          'What are the factors affecting broiler chicken production costs?',
      'answer':
          'Factors that affect broiler chicken production costs include feed prices, labor costs, energy costs, and the cost of medications and vaccines. Feed prices can have a significant impact on overall production costs as feed typically accounts for the largest expense in raising broiler chickens. Labor costs, including wages and benefits for farm workers, also play a role in determining production costs. Energy costs, such as electricity and heating, are necessary to maintain suitable conditions in broiler houses, and fluctuations in energy prices can affect production costs. Additionally, the cost of medications and vaccines to prevent and treat diseases in broiler chickens is another important factor to consider when calculating production costs.'
    },
    {
      'question': 'How do feed prices impact broiler chicken production costs?',
      'answer':
          'Feed prices have a substantial impact on broiler chicken production costs. Feed typically accounts for the largest expense in raising broiler chickens, making up around 70% of the total production costs. Fluctuations in feed prices, which are influenced by factors such as weather conditions, crop yields, and global demand, can significantly affect the profitability of broiler chicken production. When feed prices increase, producers may face higher production costs, which can reduce profit margins. Conversely, lower feed prices can lead to reduced production costs, allowing producers to potentially increase their profit margins. Therefore, closely monitoring and managing feed prices is crucial for maximizing profitability in broiler chicken production.'
    },
    {
      'question': 'How do labor costs impact broiler chicken production costs?',
      'answer':
          'Labor costs have a direct impact on broiler chicken production costs. Hiring and managing skilled labor is essential for efficient broiler chicken production. Labor costs include wages, benefits, and other expenses associated with employing farm workers. The number of workers required depends on the size of the operation and the level of automation utilized. Higher labor costs can increase production expenses, reducing profit margins. Conversely, efficient labor management and optimization can help control costs and improve overall profitability. It is essential for producers to carefully analyze and optimize labor costs to ensure a cost-effective and efficient broiler chicken production system.'
    },
    {
      'question':
          'How do energy costs impact broiler chicken production costs?',
      'answer':
          'Energy costs play a significant role in broiler chicken production costs. Energy is required for heating, ventilation, lighting, and other essential functions in broiler houses. Electricity and fuel costs can vary depending on factors such as location, energy source, and seasonality. Fluctuations in energy prices can impact production costs, directly affecting profitability. Efficient energy management, including the use of energy-efficient equipment and technologies, can help minimize costs. Additionally, optimizing temperature control systems and implementing proper insulation measures can reduce energy consumption and lower production expenses. Monitoring energy prices, adopting energy-saving practices, and exploring renewable energy sources can all contribute to reducing energy costs in broiler chicken production.'
    },
    {
      'question':
          'How do medication and vaccine costs impact broiler chicken production costs?',
      'answer':
          'The cost of medications and vaccines is an important consideration in broiler chicken production. Preventing and treating diseases is crucial for maintaining healthy flocks and maximizing production efficiency. The cost of medications and vaccines can vary depending on the type of product, the size of the operation, and the prevalence of diseases in the region. Regular vaccinations and proper biosecurity measures can help reduce the risk of disease outbreaks, minimizing the need for expensive treatments. Producers need to carefully budget for medication and vaccine costs, ensuring sufficient resources are allocated for disease prevention and control. Effective disease management strategies can help minimize production losses and ensure a profitable broiler chicken production system.'
    },
    {
      'question':
          'What are the main feed ingredients used in broiler chicken production?',
      'answer':
          'The main feed ingredients used in broiler chicken production include corn, soybean meal, wheat, and other grains. These ingredients provide the necessary energy, protein, vitamins, and minerals required for the growth and development of broiler chickens. Corn, in particular, is commonly used as a primary energy source in broiler diets due to its high starch content. Soybean meal is a valuable protein source, providing essential amino acids necessary for muscle development. Wheat and other grains are often included to diversify the nutrient profile of the feed and enhance palatability. Additionally, feed additives such as vitamins, minerals, and enzymes are incorporated to optimize broiler performance and health. Careful formulation and balancing of feed ingredients are essential to meet the nutritional requirements of broiler chickens and achieve optimal production outcomes.'
    },
    {
      'question':
          'How does the quality of feed impact broiler chicken production costs?',
      'answer':
          'The quality of feed has a significant impact on broiler chicken production costs. High-quality feed can improve broiler performance, growth rates, and feed conversion efficiency. It helps ensure that broiler chickens receive the necessary nutrients for optimal growth and development, reducing the risk of nutrient deficiencies or imbalances. By providing a balanced diet, high-quality feed can contribute to better feed utilization and minimize the amount of feed wasted. In contrast, poor-quality feed can lead to reduced growth rates, lower feed conversion efficiency, and decreased overall performance. This can result in increased production costs as more feed is required to achieve the desired growth targets. Therefore, investing in high-quality feed and regularly monitoring its nutritional composition is critical for maximizing profitability in broiler chicken production.'
    },
    {
      'question':
          'What are some strategies to reduce broiler chicken production costs?',
      'answer':
          'Several strategies can be implemented to reduce broiler chicken production costs and improve profitability. One approach is to optimize feed management, including formulating diets that meet the specific nutritional requirements of broiler chickens. By formulating feed rations accurately, producers can minimize feed wastage and ensure efficient utilization of nutrients. Implementing proper biosecurity measures and disease prevention programs can also help reduce production costs. By preventing the occurrence of diseases, producers can avoid the expenses associated with treatments and production losses. Efficient use of energy, such as utilizing energy-saving equipment and adopting renewable energy sources, can contribute to cost reduction. Finally, adopting innovative production techniques and technologies, such as precision farming and automation, can enhance productivity and reduce labor costs. Regular monitoring of key performance indicators and benchmarking against industry standards can help identify areas for improvement and cost-saving opportunities.'
    },
    {
      'question':
          'What are the benefits of using automated systems in broiler chicken production?',
      'answer':
          'Using automated systems in broiler chicken production offers several benefits. Automation can help improve labor efficiency by reducing the need for manual tasks, such as feeding and watering. It can also ensure more precise and consistent feeding, resulting in better feed utilization and improved growth rates. Automated systems can monitor and control environmental conditions, such as temperature and ventilation, ensuring optimal conditions for broiler health and performance. Additionally, automated systems can provide real-time data on key performance indicators, allowing producers to make informed decisions and implement timely interventions. These systems can also help optimize resource utilization, such as feed and energy, leading to cost savings. Overall, the use of automated systems in broiler chicken production can enhance productivity, efficiency, and profitability.'
    },
    {
      'question':
          'How can producers optimize broiler chicken housing to reduce production costs?',
      'answer':
          'Optimizing broiler chicken housing can contribute to reducing production costs. Proper ventilation is crucial to maintain optimal air quality and temperature inside the houses. Well-designed ventilation systems can help minimize energy consumption by efficiently exchanging air and removing moisture and odors. Adequate insulation can reduce heating and cooling requirements, resulting in energy savings. Optimal stocking density ensures sufficient space for each bird, preventing overcrowding and reducing stress-related issues. Efficient lighting systems can also help reduce energy costs. Finally, implementing proper biosecurity measures, such as strict sanitation protocols and controlled access to the farm, can minimize the risk of disease outbreaks, reducing the need for costly treatments and production losses. By optimizing broiler chicken housing, producers can enhance bird welfare, improve performance, and achieve cost savings.'
    },
    {
      'question':
          'What are some challenges in broiler chicken production cost management?',
      'answer':
          'Broiler chicken production cost management can pose several challenges for producers. Fluctuating feed prices can make it difficult to predict and control production costs. Changes in labor availability and wage rates can impact labor costs, requiring producers to adapt their workforce management strategies. Energy costs can be unpredictable due to market fluctuations and seasonal variations. Disease outbreaks can also have a significant impact on production costs, requiring additional expenses for treatments and potentially resulting in production losses. Furthermore, maintaining accurate records and tracking expenses can be time-consuming and challenging, especially for small-scale producers. Overcoming these challenges requires careful planning, regular monitoring, and implementing effective cost management strategies to ensure a profitable broiler chicken production system.'
    },
    {
      'question':
          'Why is monitoring production costs important in broiler chicken production?',
      'answer':
          'Monitoring production costs is crucial for broiler chicken producers to ensure profitability and make informed business decisions. By tracking expenses, producers can identify areas of high expenditure and implement cost-saving measures. Regular monitoring enables producers to evaluate the financial performance of their operations, assess the effectiveness of management strategies, and make adjustments as necessary. It helps in identifying trends and patterns in cost fluctuations, such as changes in feed prices or labor costs, allowing producers to plan and budget accordingly. Effective cost monitoring can also aid in benchmarking against industry standards, identifying areas for improvement, and setting realistic production targets. By staying aware of production costs, producers can optimize their operations, maximize efficiency, and maintain a sustainable and profitable broiler chicken production system.'
    },
    {
      'question':
          'How can benchmarking help in managing broiler chicken production costs?',
      'answer':
          'Benchmarking can be a valuable tool for managing broiler chicken production costs. By comparing key performance indicators, such as feed conversion ratio and mortality rate, with industry benchmarks, producers can evaluate their cost efficiency and identify areas for improvement. Benchmarking provides insights into best practices and allows producers to set realistic production targets. It also helps in identifying potential cost-saving opportunities by highlighting areas where performance lags behind industry standards. By continuously monitoring and benchmarking performance, producers can implement targeted improvements, optimize resource utilization, and enhance cost efficiency. This enables them to stay competitive in the market and maintain a profitable broiler chicken production system.'
    },
    {
      'question':
          'How can precision farming techniques help in optimizing broiler chicken production costs?',
      'answer':
          'Precision farming techniques can play a significant role in optimizing broiler chicken production costs. These techniques involve the use of advanced technologies, such as sensors, data analytics, and automation, to monitor and manage various aspects of production. By collecting real-time data on factors like feed consumption, growth rates, and environmental conditions, producers can make data-driven decisions to improve efficiency and reduce costs. Precision feeding systems can provide accurate and timely feed distribution, minimizing feed wastage and optimizing nutrient utilization. Environmental sensors can help maintain optimal temperature, humidity, and air quality, reducing energy consumption and improving broiler performance. Additionally, data analytics can identify patterns and trends, enabling proactive interventions to prevent production losses and optimize resource allocation. Overall, precision farming techniques offer a comprehensive and efficient approach to broiler chicken production, resulting in cost savings and improved profitability.'
    },
    {
      'question':
          'How does the scale of production affect broiler chicken production costs?',
      'answer':
          'The scale of production can have a significant impact on broiler chicken production costs. As the scale increases, producers can benefit from economies of scale, which can reduce production costs. Bulk purchasing of inputs, such as feed and medications, can lead to lower costs per unit. Larger operations may also have access to more efficient and cost-effective technologies, such as automated systems, which can enhance productivity and reduce labor costs. Additionally, larger operations may have better bargaining power with suppliers, enabling them to negotiate favorable prices for inputs. However, scaling up production also brings challenges, such as the need for additional managerial expertise, increased infrastructure requirements, and more complex logistics. Careful planning and analysis are essential when considering scaling up production to ensure that the potential benefits outweigh the associated costs.'
    },
    {
      'question':
          'What role do genetics play in broiler chicken production costs?',
      'answer':
          'Genetics play a crucial role in broiler chicken production costs. Selecting broiler breeds with desirable genetic traits, such as fast growth rates, high feed conversion efficiency, and disease resistance, can significantly impact production costs. Fast-growing broiler strains can reach market weight more quickly, reducing the time and resources required for production. High feed conversion efficiency allows broilers to convert feed into body weight more efficiently, minimizing feed wastage and reducing feed costs. Disease-resistant breeds can help lower medication expenses and reduce the risk of production losses due to disease outbreaks. Therefore, careful selection of broiler genetics is essential to optimize production efficiency, minimize costs, and maximize profitability in broiler chicken production.'
    },
    {
      'question':
          'How does the market price of broiler chickens affect production costs?',
      'answer':
          'The market price of broiler chickens directly affects production costs. Producers need to consider the selling price of broiler chickens when calculating production costs and determining profit margins. Market prices can be influenced by various factors, such as supply and demand dynamics, consumer preferences, and competition. When market prices are high, producers may enjoy higher profit margins, offsetting higher production costs. However, when market prices are low, producers may face lower profit margins or even losses if production costs exceed the selling price. Therefore, monitoring market trends and adjusting production strategies accordingly is crucial for maintaining a profitable broiler chicken production system. Producers may need to adapt their production volumes, marketing strategies, or product differentiation to align with market demand and optimize profitability.'
    },
    {
      'question':
          'How can effective financial management contribute to reducing broiler chicken production costs?',
      'answer':
          'Effective financial management plays a vital role in reducing broiler chicken production costs. By maintaining accurate and up-to-date financial records, producers can identify areas of high expenditure and implement cost-saving measures. Budgeting and cash flow management help in planning and allocating resources effectively, ensuring that production costs are within budgeted limits. Regular financial analysis, including assessing financial ratios and performance indicators, can help identify inefficiencies and areas for improvement. Financial management techniques, such as cost accounting and variance analysis, enable producers to track and control costs throughout the production process. Additionally, managing working capital, such as inventory and accounts payable, optimizes cash flow and reduces financing costs. By implementing effective financial management practices, producers can enhance cost control, improve profitability, and maintain a sustainable broiler chicken production system.'
    },
    {
      'question':
          'What role does technology play in managing broiler chicken production costs?',
      'answer':
          'Technology plays a crucial role in managing broiler chicken production costs. Advanced technologies, such as automated systems, sensors, data analytics, and precision farming techniques, can optimize various aspects of production, resulting in cost savings. Automated feeding and watering systems ensure precise and consistent delivery, minimizing feed and water wastage. Environmental sensors and control systems help maintain optimal conditions, reducing energy consumption and improving production efficiency. Data analytics can provide insights into performance patterns, facilitating proactive interventions to prevent production losses and optimize resource allocation. Additionally, technology enables real-time monitoring and remote management, allowing producers to make informed decisions and respond promptly to changing conditions. By harnessing the power of technology, producers can streamline operations, improve efficiency, and reduce costs in broiler chicken production.'
    },
    {
      'question':
          'What are the key components of a broiler chicken production cost analysis?',
      'answer':
          'A broiler chicken production cost analysis typically includes several key components. Feed costs, including the cost of ingredients, formulation, and delivery, are a significant component as feed accounts for the largest expense. Labor costs, including wages, benefits, and management expenses, also play a crucial role in production costs. Energy costs, such as electricity and heating, are important considerations, as they are necessary for maintaining suitable conditions in broiler houses. Medication and vaccine costs, including preventative measures and treatments, are essential for disease prevention and control. Other components may include housing and equipment costs, transportation and logistics expenses, and administrative and overhead costs. By analyzing these components and tracking expenses, producers can gain a comprehensive understanding of their production costs, identify areas for improvement, and implement cost-saving measures.'
    },
    {
      'question':
          'How can producers manage broiler chicken production costs during periods of high feed prices?',
      'answer':
          'Managing broiler chicken production costs during periods of high feed prices requires careful planning and proactive measures. Firstly, producers can explore alternative feed ingredients or feed formulations that offer cost savings without compromising nutritional requirements. Working closely with nutritionists and feed suppliers can help identify suitable alternatives. Secondly, optimizing feed management practices, such as reducing feed wastage and improving feed conversion efficiency, can help minimize the impact of high feed prices. Implementing proper biosecurity measures and disease prevention programs can also protect against production losses that would further increase costs. Additionally, closely monitoring market trends and adjusting production volumes or marketing strategies can help align supply with demand and optimize profitability. Finally, exploring risk management strategies, such as forward contracting or hedging, can provide some protection against price volatility. By adopting these measures, producers can navigate periods of high feed prices and maintain a sustainable broiler chicken production system.'
    },
    {
      'question':
          'What are the benefits of using cost accounting in broiler chicken production?',
      'answer':
          'Using cost accounting in broiler chicken production offers several benefits. Cost accounting provides a detailed breakdown of production costs, enabling producers to identify and analyze individual cost components. This allows for better cost control and helps in identifying areas for cost'
    },
    {
      'question':
          'What is the importance of understanind Broiler Chicken Production Costs',
      'answer':
          'In conclusion, understanding broiler chicken production costs is essential for poultry farmers and industry stakeholders. By analyzing the various factors that contribute to the overall cost, farmers can make informed decisions that optimize their profitability and sustainability. Firstly, feed costs play a significant role in broiler chicken production expenses. The cost of feed constitutes a substantial portion of the overall production costs, and fluctuations in feed prices can greatly impact a farmer’s bottom line. Therefore, it is crucial for farmers to carefully monitor and manage their feed costs by exploring cost-effective alternatives and optimizing feed conversion efficiency. Secondly, labor costs should also be considered when assessing broiler chicken production expenses. From managing the flock to maintaining the facilities, labor is an essential component of the production process. Farmers need to strike a balance between efficient labor utilization and ensuring the welfare and well-being of the chickens. Implementing automation and efficient labor management strategies can help optimize productivity and reduce labor costs. Lastly, energy costs are another significant factor that affects broiler chicken production costs. Heating, lighting, ventilation, and other energy-intensive operations contribute to the overall expenses. Farmers can explore energy-efficient solutions, such as utilizing renewable energy sources and implementing energy management systems, to mitigate the impact of rising energy costs. In conclusion, understanding the various factors that contribute to broiler chicken production costs is crucial for farmers to optimize their profitability and sustainability. By carefully managing feed costs, labor expenses, and energy usage, farmers can make informed decisions that positively impact their bottom line while ensuring the welfare of the chickens. Continuous monitoring and adaptation to changing market conditions are key in maintaining a successful broiler chicken production operation'
    },
  ];

  int _expandedIndex = -1; // Track expanded item; -1 if none are expanded

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManagementModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Management',
      color: FlutterFlowTheme.of(context).primary.withAlpha(0xFF),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderRadius: 40,
              buttonSize: 40,
              icon: Icon(
                Icons.chevron_left_sharp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 40,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
            title: AutoSizeText(
              FFLocalizations.of(context).getText(
                'w6zqmj7g' /* SIVYHAM AGRICULTURE TECHNOLOGY */,
              ),
              maxFontSize: 16,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily:
                        FlutterFlowTheme.of(context).headlineMediumFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).headlineMediumFamily),
                  ),
            ),
            actions: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: AuthUserStreamWidget(
                    builder: (context) => StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord.where(
                          'uid',
                          isEqualTo: currentUserUid,
                        ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitThreeBounce(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> circleImageUsersRecordList =
                            snapshot.data!;
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final circleImageUsersRecord =
                            circleImageUsersRecordList.isNotEmpty
                                ? circleImageUsersRecordList.first
                                : null;

                        return Container(
                          width: 50,
                          height: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            currentUserPhoto,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 4,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'tn5mczkg' /* Frequently Asked Questions */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineSmallFamily),
                              ),
                    ),
                    const SizedBox(height: 16), // Additional space below header
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _expandedIndex =
                                  _expandedIndex == index ? -1 : index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  offset: Offset(0, 2),
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: ExpandablePanel(
                              controller: ExpandableController(
                                initialExpanded: _expandedIndex == index,
                              ),
                              header: Text(
                                item['question']!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              collapsed: Container(),
                              expanded: Text(
                                item['answer']!,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                              theme: ExpandableThemeData(
                                hasIcon: true,
                                tapHeaderToExpand: true,
                                tapBodyToCollapse: true,
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
