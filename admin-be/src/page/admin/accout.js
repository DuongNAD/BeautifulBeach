import React, { useEffect, useState } from "react";
import { accounts, accountsStatus, searchAccount } from "../../api/function";
import { toast } from "react-toastify";
import Swal from "sweetalert2";
import Pagination from "../../components/Pagination";

function Accout() {
  const [listAccount, setListAccount] = useState([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");

  // Pagination State
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);

  const fetchData = async (page = 1) => {
    setLoading(true);
    try {
      let rs;
      if (search) {
        rs = await searchAccount(search, page);
      } else {
        rs = await accounts(page);
      }

      if (rs.data?.data?.data) {
        setListAccount(rs.data.data.data);
        setTotalPages(rs.data.data.last_page);
      } else {
        setListAccount(rs.data?.data || []);
        setTotalPages(1);
      }
    } catch (error) {
      console.error(error);
      toast.error("Lỗi khi tải dữ liệu người dùng.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData(currentPage);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentPage]);

  const settingStatus = async (id, status) => {
    Swal.fire({
      title: status === 1 ? "Mở khóa tài khoản?" : "Khóa tài khoản này?",
      text: "Bạn có chắc chắn muốn thực hiện hành động này?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: status === 1 ? "ACTIVE" : "BLOCK",
      cancelButtonText: "Hủy",
    }).then(async (result) => {
      if (result.isConfirmed) {
        try {
          await accountsStatus({ id_account: id, status: status });
          Swal.fire(
            status === 1 ? "Đã Mở Khoá" : "Đã Khóa",
            status === 1 ? "Tài khoản đã được ACTIVE." : "Tài khoản đã bị BLOCK.",
            "success"
          );
          fetchData(currentPage);
        } catch (error) {
          Swal.fire("Lỗi!", "Thao tác thất bại, vui lòng thử lại.", "error");
        }
      }
    });
  };

  const handleSearch = () => {
    setCurrentPage(1);
    fetchData(1);
  };

  const handlePageChange = (newPage) => {
    if (newPage >= 1 && newPage <= totalPages) {
      setCurrentPage(newPage);
    }
  };

  if (loading && listAccount.length === 0) return <p className="text-gray-500 p-4">⏳ Đang tải dữ liệu...</p>;

  return (
    <div className="bg-white p-6 rounded-lg shadow-sm">
      <div className="flex gap-3 mb-6">
        <div className="relative flex-1 max-w-md">
          <input
            type="text"
            placeholder="Tìm kiếm tài khoản (Tên, Email, SĐT)..."
            className="w-full pl-10 pr-4 py-2.5 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 shadow-sm transition"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            onKeyDown={(e) => {
              if (e.key === "Enter") handleSearch();
            }}
          />
          <svg className="w-5 h-5 text-gray-400 absolute left-3 top-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
          </svg>
        </div>
        <button
          onClick={handleSearch}
          className="px-6 py-2.5 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200 transition font-medium"
        >
          Tìm kiếm
        </button>
      </div>

      <div className="overflow-x-auto rounded-lg border border-gray-200">
        <table className="min-w-full divide-y divide-gray-200 text-sm text-left">
          <thead className="bg-gray-50 text-gray-600 font-medium">
            <tr>
              <th className="px-4 py-3">Họ và Tên</th>
              <th className="px-4 py-3">Liên hệ</th>
              <th className="px-4 py-3">Ngày sinh</th>
              <th className="px-4 py-3">Trạng thái</th>
              <th className="px-4 py-3 text-right">Thao tác</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-200 bg-white">
            {listAccount.length > 0 ? listAccount.map((item) => (
              <tr key={item.id} className="hover:bg-gray-50 transition">
                <td className="px-4 py-4 font-medium text-gray-900">{item.full_name}</td>
                <td className="px-4 py-4">
                  <div className="text-gray-900">{item.email}</div>
                  <div className="text-gray-500 text-xs">{item.phone}</div>
                </td>
                <td className="px-4 py-4 text-gray-600">
                  {new Date(item.birthday).toLocaleDateString("vi-VN")}
                </td>
                <td className="px-4 py-4">
                  <span className={`px-2.5 py-1 rounded-full text-xs font-medium ${item.status === 1 ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                    {item.status === 1 ? "Hoạt động" : "Bị khóa"}
                  </span>
                </td>
                <td className="px-4 py-4 text-right">
                  {item.status === 1 ? (
                    <button
                      type="button"
                      onClick={() => settingStatus(item.id, 0)}
                      className="inline-flex items-center gap-1.5 rounded-lg px-3 py-1.5 bg-white border border-red-200 text-red-600 hover:bg-red-50 hover:border-red-300 transition focus:outline-none focus:ring-2 focus:ring-red-500"
                    >
                      <svg viewBox="0 0 24 24" className="h-4 w-4" fill="currentColor"><path d="M12 2a5 5 0 00-5 5v3H6a2 2 0 00-2 2v7a2 2 0 002 2h12a2 2 0 002-2v-7a2 2 0 00-2-2h-1V7a5 5 0 00-5-5zm-3 8V7a3 3 0 016 0v3H9z" /></svg>
                      Lock
                    </button>
                  ) : (
                    <button
                      type="button"
                      onClick={() => settingStatus(item.id, 1)}
                      className="inline-flex items-center gap-1.5 rounded-lg px-3 py-1.5 bg-green-600 text-white hover:bg-green-700 transition focus:outline-none focus:ring-2 focus:ring-green-500 shadow-sm"
                    >
                      <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M8 11V7a4 4 0 118 0m-4 8v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2z"></path></svg>
                      Unlock
                    </button>
                  )}
                </td>
              </tr>
            )) : (
              <tr><td colSpan="5" className="px-4 py-8 text-center text-gray-500">Không tìm thấy tài khoản nào.</td></tr>
            )}
          </tbody>
        </table>
      </div>

      {totalPages > 1 && (
        <Pagination
          currentPage={currentPage}
          totalPages={totalPages}
          onPageChange={handlePageChange}
        />
      )}
    </div>
  );
}

export default Accout;
