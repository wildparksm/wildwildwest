# 코드에서는 Get-ChildItem 명령어를 사용하여 C:\Users\user\Documents\PDFs 폴더에 있는 모든 PDF 파일을 가져옵니다. 
# 그리고 Sort-Object 명령어를 사용하여 파일들을 최근 수정된 순서대로 정렬합니다. 
# 그리고 ForEach-Object 명령어를 사용하여 각각의 파일 이름을 가져와서 $pdf.FullName 변수에 저장합니다.
# 마지막으로 Out-File 명령어를 사용하여 $pdf.FullName 변수에 저장된 모든 파일들을 하나의 PDF 파일로 합쳐서 C:\Users\user\Documents\PDFs\merged.pdf 경로에 저장합니다3
$pdfs = Get-ChildItem -Path "C:\Users\user\Documents\PDFs" -Filter *.pdf
$pdfs | Sort-Object LastWriteTime | ForEach-Object { $pdf = $_; $pdf.FullName } | Out-File "C:\Users\user\Documents\PDFs\merged.pdf" -Encoding ascii