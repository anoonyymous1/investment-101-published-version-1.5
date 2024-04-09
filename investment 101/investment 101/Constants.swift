//
//  Constants.swift
//  investment 101
//
//  Created by Celine Tsai on 14/12/23.
//

import Foundation

struct K {
    static let unit1 = "Unit 1: Introduction to the Stock Market"
    static let unit2 = "Unit 2: Fundamental Analysis"
    static let unit3 = "Unit 3: Technical Analysis"
    static let unit4 = "Unit 4: Types of Investment Instruments"
    static let unit5 = "Unit 5: Investment Strategies"
    static let unit6 = "Unit 6: Portfolio Management"
    static let unit7 = "Unit 7: Market Analysis and Research"
    static let unit8 = "Unit 8: Investor Psychology and Behavior"
    static let unit9 = "Unit 9: Risk Management and Mitigation"
    static let unit10 = "Unit 10: Investment Tools and Resources"
    static let unit11 = "Unit 11: Ethics and Regulations in Investing"
    static let unit12 = "Unit 12: Tax Considerations in Investing"
    static let unit13 = "Unit 13: International Investing"
    
    static let topic11 = "Introduction to the Stock Market"
    static let topic12 = "Basics of Investing"
    static let topic21 = "Introduction to Fundamental Analysis"
    static let topic22 = "Evaluating Company Financials: Income Statements"
    static let topic23 = "Evaluating Company Financials: Balance Sheet"
    static let topic24 = "Evaluating Company Financials: Cash Flow Statement"
    static let topic25 = "Understanding Financial Ratios and Company Advantages"
    static let topic26 = "Understanding Stock Quotes"
    
    static let quiz11 = [
        Question(q: "What is the primary function of the stock market?", a: ["Facilitating the transfer of ownership in publicly traded companies", "Providing a platform for companies to raise debt capital", "Allowing investors to participate in private equity investments", "Facilitating the trading the commodities and futures"], correctAnswer: "Facilitating the transfer of ownership in publicly traded companies"),
        Question(q: "Why is the stock market important for wealth creation?", a: ["It provides a platform for companies to raise capital for growth", "It allows investors to generate wealth through stock price appreciation and dividends", "It promotes transparency and accountability in corporate governance", "It offers opportunities for short-term speculation and high-risk investments"], correctAnswer: "It allows investors to generate wealth through stock price appreciation and dividends"),
        Question(q: "Who are the main participants in the stock market?", a: ["Investors, companies, stock exchanges, brokers, regulators, and financial media", "Banks, insurance companies, and government institutions", "Private equity firms, venture capitalists, and angel investors", "Hedge funds, mutual funds, and pension funds"], correctAnswer: "Investors, companies, stock exchanges, brokers, regulators, and financial media"),
        Question(q: "What is the role of regulators in the stock market?", a: ["Ensuring fair and transparent markets and protecting investors", "Providing investment advice to individual investors", "Buying and selling stocks on behalf of investors", "Providing liquidity by continuously quoting bids and ask prices"], correctAnswer: "Ensuring fair and transparent markets and protecting investors"),
        Question(q: "What is the role of brokers in the stock market?", a: ["Executing trades on behalf of investors", "Issuing shares to raise capital for companies", "Providing liquidity by continuously quoting bids and ask prices", "Overseeing and enforcing rules and regulations in the market"], correctAnswer: "Executing trades on behalf of investors"),
        Question(q: "What is the purpose of financial media in the stock market?", a: ["Providing investment advice to individual investors", "Promoting specific stocks for higher returns", "Reporting market news, analysis, and research to investors", "Acting as intermediaries between buyers and sellers in trades"], correctAnswer: "Reporting market news, analysis, and research to investors")
    ]
    
    static let quiz12 = [
        Question(q: "What does the stock market refer to?", a: ["A place where companies sell their products", "A collection of exchanges for buying and selling stocks", "A platform for advertising products and services", "A marketplace for buying and selling real estate"], correctAnswer: " A collection of exchanges for buying and selling stocks"),
        Question(q: "What do stocks represent?", a: ["Ownership shares in a company", "Units of ownership in real estate properties", "Ownership stakes in government bonds", "Ownership in mutual funds"], correctAnswer: "Ownership shares in a company"),
        Question(q: "What does 'risk' refer to in investing?", a: ["The possibility of achieving high returns", "The possibility of losing some or all of the invested capital", "The certainty of making a profit from an investment", "The process of diversifying investments"], correctAnswer: "The possibility of losing some or all of the invested capital"),
        Question(q: "How can investors benefit from stocks?", a: ["By receiving a fixed monthly income", "By gaining partial ownership and potential profits from the company's growth", "By getting tax benefits from the government", "By gaining access to discounted products from the company"], correctAnswer: "By gaining partial ownership and potential profits from the company's growth"),
        Question(q: "What is the financial gain or loss generated from an investment called?", a: ["Capital appreciation", "Capital depreciation", "Capital preservation", "Capital elimination"], correctAnswer: "Capital appreciation"),
        Question(q: "Why is it important to set financial goals before investing?", a: ["It allows investors to take more risks in their investments", "It helps investors determine the best investment options for short-term gains", "It provides a roadmap and direction for investments to achieve specific objectives", "It ensures that investments are kept secret from others"], correctAnswer: "It provides a roadmap and direction for investments to achieve specific objectives"),
        Question(q: "What is the recommended approach to making investment decisions?", a: ["Follow the advice of friends and family members who have experience in investing", "Rely on predictions and speculative information from financial news channels", "Seek guidance from a qualified financial advisor and consider individual circumstances", "Make impulsive decisions based on emotions and market trends"], correctAnswer: "Seek guidance from a qualified financial advisor and consider individual circumstances")
    ]
    static let quiz21: [Question] = []
    static let quiz22 = [
        Question(q: "What does an income statement provide information about?", a: ["Assets and liabilities", "Cash flow activities", "Revenues, expenses, profitability", "Changes in working capital"], correctAnswer: "Revenues, expenses, and profitability"),
        Question(q: "Which term is used interchangeably with 'income statement'?", a: ["Balance sheet", "Cash flow statement", "Statement of cash flows", "Profit and loss statement"], correctAnswer: "Profit and loss statement"),
        Question(q: "What does 'COGS' stand for in the context of an income statement?",a: ["Cost of General Services", "Cash on Goods Sold", "Cost of Goods Sold", "Current Operating Gross Sales"], correctAnswer: "Cost of Goods Sold"),
        Question(q: "What is the Gross Profit on an income statement?", a: ["Total revenue", "Total expenses", "Revenue minus Cost of Goods Sold", "Operating income minus interest and taxes"], correctAnswer: "Revenue minus Cost of Goods Sold"),
        Question(q: "Which category on the income statement includes expenses like marketing, salaries, and rent?", a: ["Revenue/Sales", "Cost of Goods Sold", "Operating Income", "Selling, General, and Administrative Expenses"], correctAnswer: "Selling, General, and Administrative Expenses"),
        Question(q: "What is the result of subtracting Selling, General, and Administrative Expenses from Gross Profit?", a: ["Net Income", "Operating Income", "Operating Expenses", "Total Revenue"], correctAnswer: "Operating Income"),
        Question(q: "What does the net income represent on the income statement?", a: ["Total expenses", "Total revenue", "Final profit after all costs", "Operating income minus taxes"], correctAnswer: "Final profit after all costs"),
        Question(q: "When is a company considered profitable based on net income?", a: ["When net income is negative", "When net income is positive", "When operating income is negative", "When gross profit is negative"], correctAnswer: "When net income is positive")
    ]
    static let quiz23 = [
        Question(q: "What does a balance sheet provide information about?", a: ["Key financial ratios", "Cash flow activities", "Revenues, expenses, and profitability", "Changes in working capital"], correctAnswer: "Revenues, expenses, and profitability"),
        Question(q: "What is another term used interchangeably with 'balance sheet'?", a: ["Income statement", "Cash flow statement", "Statement of cash flows", "Financial statement"], correctAnswer: "Financial statement"),
        Question(q: "What does 'Assets' represent on a balance sheet?", a: ["Debts owed to external parties", "Everything owned by the company", "Ownership interest of shareholders", "Financial obligations"], correctAnswer: "Everything owned by the company"),
        Question(q: "What is the key component that represents the company's value after deducting all liabilities?", a: ["Assets", "Liabilities", "Current liabilities", "Shareholder’s equity"], correctAnswer: "Shareholder’s equity"),
        Question(q: "What is the main purpose of current assets on a balance sheet?", a: ["Generate long-term returns", "Meet short-term obligations", "Invest in other companies", "Reduce shareholder's equity"], correctAnswer: "Meet short-term obligations"),
        Question(q: "What does 'COGS' stand for on a balance sheet?", a: ["Cost of Goods Sold", "Current Operating Gross Sales", "Cash on Goods Sold", "Cost of General Services"], correctAnswer: "Cost of Goods Sold"),
        Question(q: "What is the function of 'Accounts receivable' in current assets?", a: ["Money owed by the company to suppliers", "Money received from customers for goods sold", "Money invested in long-term assets", "Money spent on advertising"], correctAnswer: "Money received from customers for goods sold"),
        Question(q: "Which type of asset includes patents, trademarks, and copyrights?", a: ["Fixed assets", "Current assets", "Long-term investments", "Intangible assets"], correctAnswer: "Intangible assets"),
        Question(q: "What do 'Current liabilities' represent on a balance sheet?", a: ["Long-term financial obligations", "Debts owed to external parties", "Assets converted into cash within a year", "Short-term financial obligations"], correctAnswer: "Short-term financial obligations"),
        Question(q: "What are 'Accrued expenses' on a balance sheet?", a: ["Payments received from customers", "Expenses incurred but not yet paid", "Current assets", "Long-term liabilities"], correctAnswer: "Expenses incurred but not yet paid"),
        Question(q: "What do 'Long-term liabilities' represent?", a: ["Short-term financial obligations", "Assets converted into cash within a year", "Financial obligations beyond the current year", "Payments received from customers"], correctAnswer: "Financial obligations beyond the current year"),
        Question(q: "What is the meaning of 'Deferred revenue'?", a: ["Payments received from customers", "Expenses incurred but not yet paid", "Short-term financial obligations", "Payments received in advance for goods/services"], correctAnswer: "Payments received in advance for goods/services"),
        Question(q: "What does 'Pension liabilities' represent?", a: ["Payments to employees after retirement", "Long-term financial obligations", "Expenses incurred but not yet paid", "Payments received from customers"], correctAnswer: "Payments to employees after retirement"),
        Question(q: "What does 'Shareholder's equity' represent?", a: ["Long-term financial obligations", "Payments received from customers", "Ownership interest of shareholders", "Assets converted into cash within a year"], correctAnswer: "Ownership interest of shareholders"),
        Question(q: "What is 'Common Stock' in shareholder's equity?", a: ["Ownership shares with voting rights", "Excess payments over par value", "Accumulated profits of the company", "Long-term financial obligations"], correctAnswer: "Ownership shares with voting rights"),
        Question(q: "What is the purpose of 'Retained earnings' in shareholder's equity?", a: ["Excess payments over par value", "Ownership shares with voting rights", "Accumulated profits reinvested in the business", "Payments received from customers"], correctAnswer: "Accumulated profits reinvested in the business"),
        Question(q: "Why is it important to analyze the components of shareholder's equity?", a: ["To determine total liabilities", "To identify short-term obligations", "To assess company's past earnings", "To understand the company's net worth"], correctAnswer: "To understand the company's net worth")
    ]
    
    static let quiz24 = [
        Question(q: "What does the cash flow statement track?", a: ["Company's net income", "Company's assets and liabilities", "Cash flows of operating, investing, and financing activities", "Changes in working capital"], correctAnswer: "Cash flows of operating, investing, and financing activities"),
        Question(q: "What is the key difference between cash flow and revenue?", a: ["Cash flow includes revenue and expenses", "Cash flow is the same as revenue", "Cash flow is always positive", "Cash flow represents future revenue"], correctAnswer: "Cash flow includes revenue and expenses"),
        Question(q: "Why might a company have positive cash flow but not be profitable?", a: ["Due to high revenue and low expenses", "Due to low revenue and high expenses", "Due to high net income", "Due to high dividend payments"], correctAnswer: "Due to high revenue and low expenses"),
        Question(q: "What are non-cash charges in the cash flow statement?", a: ["Expenses that require direct cash payment", "Expenses that don't affect profitability", "Expenses that involve actual cash outflows", "Expenses that don't require a direct cash payment"], correctAnswer: "Expenses that don't require a direct cash payment"),
        Question(q: "Which of the following is considered a non-cash charge?", a: ["Stock-based compensation", "Cost of Goods Sold", "Interest expenses", "Income tax payments"], correctAnswer: "Stock-based compensation"),
        Question(q: "What do depreciation and amortization represent?", a: ["Cash expenses", "Non-cash expenses", "Cash inflows", "Investment activities"], correctAnswer: "Non-cash expenses"),
        Question(q: "What is the purpose of changes in working capital?", a: ["To calculate net income", "To assess long-term investments", "To evaluate dividend payments", "To reflect fluctuations in available funds for operations"], correctAnswer: "To reflect fluctuations in available funds for operations"),
        Question(q: "How does an increase in inventory affect working capital?", a: ["It increases working capital", "It has no impact on working capital", "It decreases working capital", "It depends on the type of inventory"], correctAnswer: "It decreases working capital"),
        Question(q: "What does the investing activities section of the cash flow statement show?", a: ["Changes in debt issuance or repayment", "Changes in equity issuance or repurchase", "Cash flows related to investments in assets", "Cash flows related to financing and capital structure"], correctAnswer: "Cash flows related to investments in assets"),
        Question(q: "What does the financing activities section of the cash flow statement include?", a: ["Cash flows related to investments in assets", "Cash flows related to operations", "Cash flows related to debt issuance or repayment", "Cash flows related to inventory management"], correctAnswer: "Cash flows related to debt issuance or repayment"),
        Question(q: "Why might a company issue new shares of stock?", a: ["To decrease cash flow", "To attract potential investors", "To reduce profitability", "To increase short-term expenses"], correctAnswer: "To attract potential investors"),
        Question(q: "What does repurchasing equity involve?", a: ["Issuing new shares to raise funds", "Buying back the company's own shares", "Distributing profits to shareholders", "Reducing cash flow"], correctAnswer: "Buying back the company's own shares"),
        Question(q: "What does dividend distribution reflect?", a: ["Company's commitment to reducing cash flow", "Company's commitment to managing debt", "Company's financial health and return to shareholders", "Company's focus on increasing working capital"], correctAnswer: "Company's financial health and return to shareholders"),
        Question(q: "Why is a comprehensive analysis of cash flow important?", a: ["To ensure high cash flow", "To assess investment strategies", "To increase inventory levels", "To avoid dividend payments"], correctAnswer: "To assess investment strategies")
    ]
    
    static let quiz25 = [
        Question(q: "What does the Gross Profit Margin ratio indicate about a company's financial health?",a: ["Percentage of revenue exceeding the cost of goods sold","Ability to cover short-term obligations with current assets","Profitability of core operations",  "Proportion of debt used to finance assets"  ], correctAnswer: "Percentage of revenue exceeding the cost of goods sold"  ),
        
        Question(q: "Where can investors find financial reports to review a company's financial ratios?",  a: ["Social media platforms",  "Official website's investor relations section", "Entertainment websites",   "Health and wellness blogs"],  correctAnswer: "Official website's investor relations section" ),
        
        Question(q: "What does the Quick Ratio measure?", a: [ "Profitability of core operations",  "Ability to meet short-term liabilities without relying on inventory sale", "Percentage of revenue exceeding the cost of goods sold",  "Proportion of debt used to finance assets"],  correctAnswer: "Ability to meet short-term liabilities without relying on inventory sale"),
        
        Question(q: "What does Return on Equity (ROE) evaluate?",  a: [  "Company's ability to cover interest expenses", "Ability to manage production costs effectively",  "Generation of returns on shareholders' equity", "Competitive advantage in the market"], correctAnswer: "Generation of returns on shareholders' equity"),
        
        Question(
            q: "Where is information about a company's management team typically found?", a: ["Investor relations section of the official website", "Health and fitness magazines", "Cooking blogs", "Entertainment news websites"], correctAnswer: "Investor relations section of the official website"),
        
        Question(q: "What is a competitive advantage in fundamental analysis?", a: ["Ability to cover short-term obligations with current assets", "A unique strength that sets a company apart from competitors", "Profitability of core operations", "Proportion of debt used to finance assets"], correctAnswer: "A unique strength that sets a company apart from competitor"),
        
        Question(q: "Why is evaluating the management team crucial in fundamental analysis?", a: ["To assess the company's liquidity", "To understand the company's competitive position", "To evaluate strategic decisions and execution", "To measure the debt-to-equity ratio"], correctAnswer: "To evaluate strategic decisions and execution"),
        
        Question(q: "What does the Debt-to-Equity Ratio show?", a: ["Ability to cover interest expenses", "Percentage of revenue exceeding the cost of goods sold", "Proportion of debt used to finance assets relative to shareholders' equity", "Ability to meet short-term liabilities without relying on inventory sale"],correctAnswer: "Proportion of debt used to finance assets relative to shareholders' equity")
    ]

    static let quiz26 = [
        Question(q: "What does the 'Open' in a stock quote represent?",  a: ["The highest price a buyer is willing to pay", "The closing value of the stock in the last trading session", "The initial price level at the beginning of the trading day", "The lowest price a seller is willing to accept"], correctAnswer: "The initial price level at the beginning of the trading day"),

        Question(q: "How is the 'Day Range' calculated?", a: ["By multiplying the current stock price by the number of outstanding shares","By calculating the difference between the lowest and highest prices", "By expressing the dividend yield as a percentage", "By measuring a stock's volatility compared to a benchmark index"], correctAnswer: "By calculating the difference between the lowest and highest prices"),

        Question(q: "What does 'Beta (5Y Monthly)' measure?",a: ["A stock's volatility in relation to the market",
                "The ratio of a company's share price to its earnings per share", "The portion of a company's profit allocated to each outstanding share", "The difference between the lowest and highest prices at which a stock has traded"],  correctAnswer: "A stock's volatility in relation to the market"),

        Question(q: "What does 'Ex-Dividend Date' signify?", a: ["The date on which a company is scheduled to release its financial results", "The date a stock is traded without a previously declared dividend", "The average number of shares traded daily", "The total market value of a company's outstanding shares"], correctAnswer: "The date a stock is traded without a previously declared dividend"),

        Question(q: "How does 'PE Ratio' (Price-to-Earnings Ratio) help investors?", a: ["By measuring a stock's volatility compared to a benchmark index", "By expressing the dividend yield as a percentage", "By reflecting the market's expectations for a company's future earnings growth", "By calculating the difference between the lowest and highest prices"],
            correctAnswer: "By reflecting the market's expectations for a company's future earnings growth"),

        Question(q: "What is the significance of 'Avg. Volume' in a stock quote?", a: ["To determine eligibility for receiving upcoming dividends", "To indicate the company's dividend policy and yield", "To provide insight into a company's profitability on a per-share basis", "To offer a smoothed-out view of a stock's trading activity"], correctAnswer: "To offer a smoothed-out view of a stock's trading activity"),

        Question(q: "Why is the '52-week Range' important for investors?", a: ["To provide insight into a company's profitability on a per-share basis", "To determine eligibility for receiving upcoming dividends",  "To reflect the overall value of the company in the stock market", "To offer a broader perspective on a stock's performance"], correctAnswer: "To offer a broader perspective on a stock's performance"),

        Question(q: "What does 'Forward Dividend & Yield' reveal?", a: ["The lowest price a seller is willing to accept for a stock", "The average number of shares traded daily", "The estimated annual dividend payment per share and the dividend yield","The closing value of the stock in the last trading session"], correctAnswer: "The estimated annual dividend payment per share and the dividend yield")
    ]



    static let article11path = Bundle.main.path(forResource: "article11", ofType: "html")
    static let article11URL = URL(fileURLWithPath: article11path!)
    static let article12path = Bundle.main.path(forResource: "article12", ofType: "html")
    static let article12URL = URL(fileURLWithPath: article12path!)
    static let article21path = Bundle.main.path(forResource: "article21", ofType: "html")
    static let article21URL = URL(fileURLWithPath: article21path!)
    static let article22path = Bundle.main.path(forResource: "article22", ofType: "html")
    static let article22URL = URL(fileURLWithPath: article22path!)
    static let article23path = Bundle.main.path(forResource: "article23", ofType: "html")
    static let article23URL = URL(fileURLWithPath: article23path!)
    static let article24path = Bundle.main.path(forResource: "article24", ofType: "html")
    static let article24URL = URL(fileURLWithPath: article24path!)
    static let article25path = Bundle.main.path(forResource: "article25", ofType: "html")
    static let article25URL = URL(fileURLWithPath: article25path!)
    static let article26path = Bundle.main.path(forResource: "article26", ofType: "html")
    static let article26URL = URL(fileURLWithPath: article26path!)
}
