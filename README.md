# ETEVERS Hands-On Lab feat. Terraform

## 🗂️ 테라폼을 이용한 AWS 3-Tier 인프라 폴더 구조

```bash
.
├── 1. prod-vpc.tf                 # VPC 구성
├── 2. prod-gw_routing-table.tf     # 게이트웨이 및 라우팅 테이블 설정
├── 3. prod-security-group.tf       # 보안 그룹 설정
├── 4. prod-ec2-web.tf              # EC2 웹 서버 구성
├── 5. prod-rds-db.tf               # RDS 데이터베이스 구성
├── 6. prod-alb.tf                  # ALB (Application Load Balancer) 설정
├── 7. prod-LT.tf                   # Launch Template 설정
├── 8. prod-asg.tf                  # Auto Scaling Group 설정
├── README.md                       # 프로젝트 설명 문서
├── backend.tf                      # 백엔드 설정 파일
├── user_data.sh                    # EC2 초기 설정 스크립트
└── user_data.tf                    # EC2 초기 설정을 위한 테라폼 스크립트
