<center><h1>A+ Music</h1></center>

<p align="center">
  <img width="300"  src="https://i.imgur.com/BU74Ec0.png">
</p>


# Giới thiệu

Đây là mã nguồn của dự án A+ Music của mình. Vì mình chỉ thực hiện A+ Music trong vòng một tháng vừa học vừa làm nên code có thể chưa được đẹp cho lắm. Tuy nhiên A+ Music cũng có khá đầy đủ các chức năng của một website chia sẻ nhạc hoàn chỉnh.

Mình đạt tên trang web là A+ Music để thể hiện mong muốn đem lại những bài hát có chất lượng tốt nhất A+ đến với người nghe. A+ Music có giao diện đẹp mắt, thân thiện và dễ sử dụng với cả người dùng thường và người quản trị trang web. Trang có tính responsive cao, có thể hiển thị tốt, thân thiện với mọi kích cỡ màn hình.

# Công nghệ sử dụng

Công nghệ sử dụng để xây dựng hệ thống là các công nghệ phổ biến hiện nay, đặc biệt là thân thiện với người dùng cũng như lập trình viên:

* Phía Client (Front-end): A+ Music được viết bằng các ngôn ngữ phổ biến nhất hiện là HTML, CSS và Javascript. A+ Music cũng sử dụng framework Bootstrap 4 và thư viện Jquery để có đem lại trải nghiệm thân thiện, dễ sử dụng tới người dùng. Và có thể giúp website hiển thị responsive, phù hợp, thân thiện với mọi cỡ màn hình.

* Phía Server (Back-end): A+ Music xây dựng trên hai công nghệ nổi tiếng của Java web là Servlet API, JSP và sử dụng hệ quản trị cơ sở dữ liệu MYSQL để lưu trữ database để hệ thống có thể hoạt động ổn định và có tính bảo mật cao. Và sử dụng Apache Tomcat 8.5.35 để chạy.

# Tổ chức website

Website sẽ gồm ba phần chính: 

* Phần chung cho mọi người dùng (khách, người dùng có tài khoản, người quản trị website) 

* Phần dành cho người dùng thường có tài khoản.

* Phần dành cho quản trị viên web.

# Các chức năng của website

## Chức năng chung:

- Cập nhật các bài hát mới ngay trên trang chủ. Trang chủ được chia làm 2 phần chính là Bài hát mới(chưa các bài hát mới) và Bảng xếp hạng(chứa bảng xếp hạng các bài hát.) Mỗi phần được chia làm 3 loại nhạc phổ biến là Việt Nam, Âu Mỹ và Hàn Quốc.
- Nghe các bài hát có trên hệ thống A+ Music. Và biết được các thông tin cơ bản về bài hát như: tên bài hát, thể loại, ca sĩ, lời bài hát và ảnh đại diện cho bài hát và số lượt nghe bài hát.
- Thể loại: là chức năng giúp người dùng lọc ra các bài hát thuộc thể loại mình yêu thích, được sắp xếp theo thứ tự mới nhất đến cũ hơn. Các thể loại nhạc có trên A+ Music hiện tại là các thể loại nhạc phổ biến hiện nay như: nhạc trẻ, nhạc Trịnh, tiền chiến, thiếu nhi, Hip Hop/Rap, hay các dòng nhạc nước ngoài như Pop, Rocks, nhạc Hàn,... 
- Bảng xếp hạng: là chức năng giúp người dùng biết được bài hát nào đang được nghe nhiều nhất trong tuần. Chức năng này được xếp theo các thể loại nhạc mà A+ Music có. Gíup người dùng có thể biết bài hát nào đang được nghe nhiều nhất ở loại nhạc yêu thích của họ.
- Nghệ sĩ: Là trang chứa các danh sách nghệ sĩ(ca sĩ) trên A+ Music. Với mỗi nghệ sĩ sẽ có một trang thông tin riêng bao gồm: Nghệ danh, tên thật, ngày tháng năm sinh, quê quán và tiểu sử. Ngoài ra, tại trang thông tin riêng của một nghệ sĩ, người dùng còn có thể biết được danh sách bài hát của nghệ sĩ đó có trên hệ thống A+ Music. Người dùng có thể đi tới trang các nhân nghệ sĩ qua chức năng tìm kiếm hay liên kết từ bài hát họ mới nghe.
- Giới thiệu: Người dùng có thể dễ dàng đọc Giới thiệu về A+ Music, Chính sách, Điều khoản dịch vụ, thông tin liên hệ của trang một cách dễ dàng.

### Chức năng tìm kiếm:

- Người dùng có thể dễ dàng tìm kiếm nghệ sĩ, bài hát của họ trên hệ thống.

### Chức năng đăng kí, đăng nhập tài khoản trên hệ thống:

- Người dùng có thể dễ dàng đăng kí tài khoản và đăng nhập vào hệ thống để sử dụng các tính năng dành riêng cho người dùng có tài khoản.

## Chức năng dành cho người dùng có tài khoản:

* Có thể sửa đổi các thông tin tài khoản như email đăng kí, mật khẩu tài khoản, ngày tháng năm sinh, giới tính và có thể thay đổi ảnh đại diện của tài khoản.

* Có thể upload bài hát lên hệ thống A+ Music.

* Sửa đổi thông tin các bài hát sau khi upload và được phê duyệt.

* Báo cáo bài hát vi phạm bản quyền,… tới quản trị viên A+ Music qua nút report dưới mỗi bài hát.

## Chức năng dành cho quản trị viên:

* Có thể sửa đổi các thông tin tài khoản như email đăng kí, mật khẩu tài khoản, ngày tháng năm sinh, giới tính và có thể thay đổi ảnh đại diện của tài khoản.

* Có thể xử lý các phiếu report bài hát vi phạm điều khoản của trang được gửi lên của người dùng.

* Có thể phê duyệt bài duyệt bài hát do người dùng upload lên. 

* Tìm kiếm người dùng trên hệ thống và có thể xóa khỏi hệ thống.

* Tìm kiếm bài hát mà người dùng upload lên và có thể xóa khỏi hệ thống.

# Bảo mật

* A+ Music có các tính năng bảo mật cơ bản một website.

* Các chức năng dành cho người dùng có tài khoản, hay quản trị viên đều yêu cầu phải đăng nhập đúng loại tài khoản tương ứng mới có thể sử dụng.

* Với phía client, để hiện thị ra giao diện các kết quả lấy từ CSDL, A+ Music dùng thư viện JSTL, và Expression Language của thư viện này thay vì dùng các thẻ Script let để hạn chế tối đa lỗ hổng bảo mật trên trang.

## Trang hiện đã được phòng chống tấn công, khai thác bởi một số lỗi bảo mật phổ biến hiện nay như:

* SQL injection

* XSS

* Clickjacking: bằng cách thêm HTTP Hearder để ngăn kẻ tấn công iframe trang.

* Phòng chống tấn công qua file upload: 

* Hệ thống hiện tại có cho phép upload ảnh và upload nhạc. Để phòng tránh tấn công bằng việc upload file độc hại, A+ Music có xử lý đơn giản như sau:
  - Kiểm tra loại file (.mp3, .jpg, .png) có hợp lệ không bên phía server trước khi cho upload lên hệ thống.
  - Thay đổi tên file người dùng upload lên bằng tên mà theo chuẩn của hệ thống: “acongmusic-audio-**username**-**time**.đuôi-file” với file là audio, và “acongmusic-image-**username**-**time**.đuôi-file” với file là ảnh. (**username** là username của người dùng upload, **time** là thời gian hiện tại của hệ thống tính theo mili second).
  - Bằng việc thay đổi tên file như này có thể giúp hệ thống: 
    - Không sợ bị trùng tên file gây xung đột. 
    - Phòng tránh được kiểu tấn công Buffer Overflow khi kẻ tấn công cố tình đặt tên file dài quá số lượng an toàn. 
    - Nếu kẻ tấn công có upload một số file thực thi script và có thể qua mặt được việc xác thực kiểu file (đuôi file) lên hệ thống rồi gọi chúng theo url trên trình duyệt để thực thi script thì bằng việc thay đổi tên file., kẻ tấn công sẽ khó biết tên file chính xác để có thể gọi file mã độc.

* Mã hóa mật khẩu người dùng:
  - Để bảo mật thông tin người dùng, mật khẩu người dùng sẽ được mã hóa trước khi thêm vào cơ sở dữ liệu. Em dùng thuật toán Bcrypt để mã hóa mật khẩu thay vì dùng MD5,… vì Brypt mỗi lần chạy sẽ sinh ra một chuỗi mã hóa khác nhau dù chuỗi mật khẩu ban đầu là giống nhau, nên nếu dữ liệu có bị đánh cắp thì kẻ tấn công cũng sẽ tốn nhiều thời gian hơn để giải mã, brute force.

# Hướng dẫn

Các bạn chỉ việc tải về và sử dụng Eclipse hay NetBeans để chạy thử.

Lưu ý: 

* Mình sử dụng CSDL là MY SQL. CSDL mẫu được để ở `database/acongmusic.sql`. Các bạn có thể dùng file này để sinh ra CSDL mẫu.
* Các bạn cần sửa lại username và password để connect MY SQL ở *mọi file* trong `src/dao`.
* Các bạn có thể cần sử dụng các thư viện hỗ trợ (MY SQL Connector, JDBC,...) mà mình sử dụng ở thư mục `Lib`.
