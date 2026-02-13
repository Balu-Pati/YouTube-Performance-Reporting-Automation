# YouTube Performance-Reporting Automation

## Project Overview
This project builds an automated reporting solution to analyze YouTube video performance and audience engagement using SQL and Power BI.
The solution integrates raw video and comment data, performs data validation, and delivers automated dashboards for monitoring performance trends and engagement metrics.

The project demonstrates reporting automation, data quality checks, analytics workflows, and dashboard development aligned with enterprise reporting environments.

---

## Objectives
- Automate performance reporting workflows
- Analyze video engagement trends
- Monitor audience sentiment and interaction patterns
- Replace manual Excel reporting with automated dashboards
- Deliver data-driven performance insights

---

## Dataset Description
The project uses two datasets:

### Video Dataset
Contains:
- Video ID
- Title
- Published date
- Views
- Likes
- Comments
- Keywords

### Comments Dataset
Contains:
- Video ID
- Comment details
- Likes
- Sentiment score (positive/neutral/negative)

---

## Project Workflow
Raw CSV Files
↓
MySQL Database Integration
↓
Data Cleaning & Validation
↓
SQL Reporting Views
↓
Power BI Dashboards
↓
Automated Reporting

---

## Database Layer
Data is stored in MySQL and integrated using:

- Video table
- Comment table
- Reporting views for engagement and performance analysis

Data validation steps include:
- Duplicate removal
- Null checks
- Format correction
- Data consistency verification

---

## Dashboard Features
The Power BI dashboard provides:

### Performance Overview
- Total Views
- Total Likes
- Total Comments
- Engagement Rate
- Top performing videos

### Engagement Analysis
- Views vs engagement comparison
- Top engagement videos
- Engagement efficiency insights

### Sentiment Analysis
- Comment sentiment distribution
- Video sentiment performance

### Monthly Trends
- Views trend over time
- Likes trend over time

---

## Automation Layer
Dashboards refresh automatically when database updates occur, eliminating manual reporting work.

Workflow: New Data → Database Update → Views Refresh → Dashboard Update

## Tools & Technologies
- MySQL
- Power BI
- SQL
- Excel (data preprocessing)

---

## Business Impact
The solution demonstrates:
- Reporting automation
- Data quality improvement
- Efficient performance monitoring
- Automated analytics reporting
- Decision-support insights

---

## Future Improvements
- Real-time data ingestion
- Advanced sentiment NLP models
- Predictive engagement analysis
- API-based automated data pipelines

---

