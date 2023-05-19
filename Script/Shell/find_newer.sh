# /RMANBKP/backup/open 파일 중 지난 주 금요일 이전 데이터 삭제
find /RMANBKP/backup/open -type f ! -newermt $(date -d "last friday" +%Y-%m-%d)