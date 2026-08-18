# Hệ Thống Quản Lý Kinh Doanh & Phân Phối Thiết Bị Gia Đình

## 1. Bối cảnh & Bài toán nghiệp vụ
Công ty kinh doanh thiết bị gia đình cần một giải pháp phần mềm tổng thể để quản lý chuỗi cung ứng và vận hành. Hệ thống giúp tự động hóa quy trình từ khâu tiếp nhận đơn hàng của đại lý, kiểm tra tồn kho, lập hóa đơn, xuất kho giao hàng cho đến thống kê báo cáo doanh thu, nhằm tối ưu hóa thời gian xử lý và hạn chế sai sót dữ liệu.

## 2. Các phân hệ chức năng chính (Key Modules)
- **Quản lý Hệ thống & Phân quyền (RBAC):** Đăng nhập/đăng xuất, phân quyền chức năng theo 5 nhóm người dùng (Bán hàng, Kho, Xuất sản phẩm, Vận chuyển, Ban giám đốc).
- **Quản lý Danh mục (Đại lý, Sản phẩm, Nhân viên):**
  - Quản lý & tra cứu đại lý, thông tin sản phẩm (mã, thời hạn bảo hành, số lượng tồn).
  - Hồ sơ nhân viên & quản lý thuộc tính riêng (VD: "Số hiệu người chuyển" cho nhân viên vận chuyển).
- **Xử lý Bán hàng & Lập Hóa đơn:** Tiếp nhận đơn đặt hàng từ đại lý, kiểm tra tồn kho tự động (phát cảnh báo nếu thiếu hàng), khởi tạo hóa đơn và theo dõi trạng thái thanh toán.
- **Xuất kho & Vận chuyển:** Lập phiếu chuyển sản phẩm từ hóa đơn đã thanh toán, bàn giao cho nhân viên giao hàng và lưu vết kết quả giao nhận.
- **Thống kê & Báo cáo:** Xuất báo cáo doanh thu theo tháng/đại lý, thống kê sản lượng bán ra và lượng hàng tồn kho phục vụ ra quyết định kinh doanh cho Ban giám đốc.

## 3. Một vài sơ đồ thiết kế
- **Sơ đồ usecase
<img width="919" height="732" alt="UseCaseDiagram" src="https://github.com/user-attachments/assets/a2500cbb-29b6-4790-a576-8eeb1f737c5d" />
- **Sơ đồ lớp
<img width="812" height="899" alt="SoDoLop" src="https://github.com/user-attachments/assets/5a9f6377-66a3-4a00-ae41-bb91c6f2ee0a" />
- **Lược đồ quan hệ
<img width="556" height="556" alt="LuocDoQH" src="https://github.com/user-attachments/assets/5607cbce-048d-475b-8dc8-5594671eb1f4" />
