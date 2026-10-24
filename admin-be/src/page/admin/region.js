import React, { useEffect, useState } from "react";
import {
  addRegion,
  deleteRegion,
  region,
  searchRegion,
  updateRegion,
} from "../../api/function";
import { toast } from "react-toastify";
import Swal from "sweetalert2";
import Pagination from "../../components/Pagination";

function Region() {
  const [regionlist, setRegions] = useState([]);
  const [loading, setLoading] = useState(true);
  const [formData, setFormData] = useState({ name: "", id: null });
  const [showForm, setShowForm] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [search, setSearch] = useState("");

  // Pagination State
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const fetchData = async (page = 1) => {
    setLoading(true);
    try {
      let rs;
      if (search) {
        rs = await searchRegion(search, page);
      } else {
        rs = await region(page);
      }

      if (rs.data?.data?.data) {
        setRegions(rs.data.data.data);
        setTotalPages(rs.data.data.last_page);
      } else {
        setRegions(rs.data?.data || []);
        setTotalPages(1);
      }
    } catch (error) {
      console.error(error);
      toast.error("Lỗi khi tải dữ liệu vùng miền.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData(currentPage);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentPage]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsLoading(true);
    try {
      const method = formData.id !== null ? "PUT" : "POST";
      let rs;
      if (method === "POST") {
        rs = await addRegion({ name: formData.name });
      } else {
        rs = await updateRegion(
          { name: formData.name, _method: "PUT" },
          formData.id
        );
      }
      toast.success(rs.data?.message);

      setIsLoading(false);
      fetchData(currentPage);
      setShowForm(false);
      setFormData({ name: "", id: null });
    } catch (error) {
      const errors = error.response?.data?.errors;
      if (errors) {
        Object.values(errors).forEach((errArray) => {
          errArray.forEach((msg) => toast.error(msg));
        });
      } else {
        toast.error("Có lỗi xảy ra, vui lòng thử lại!");
      }
      setIsLoading(false);
    }
  };

  const handleEdit = (value) => {
    setFormData(value);
    setShowForm(true);
  };

  const handleSearch = () => {
    setCurrentPage(1);
    fetchData(1);
  };

  const handleDelete = (value) => {
    Swal.fire({
      title: "Xóa vùng miền?",
      text: "Hành động này không thể hoàn tác!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "XÓA",
      cancelButtonText: "Hủy",
    }).then(async (result) => {
      if (result.isConfirmed) {
        try {
          await deleteRegion(value.id);
          Swal.fire("Đã Xóa!", "Dữ liệu đã được xóa.", "success");
          fetchData(currentPage);
        } catch (error) {
          Swal.fire("Lỗi!", "Xóa thất bại, vui lòng thử lại.", "error");
        }
      }
    });
  };

  const handlePageChange = (newPage) => {
    if (newPage >= 1 && newPage <= totalPages) {
      setCurrentPage(newPage);
    }
  };

  if (loading && regionlist.length === 0) return <p className="text-gray-500 p-4">⏳ Đang tải dữ liệu...</p>;

  return (
    <div className="bg-white p-6 rounded-lg shadow-sm">
      <div className="flex gap-3 mb-6">
        <button
          type="button"
          className="px-5 py-2.5 rounded-lg bg-blue-600 text-white font-medium shadow-md hover:bg-blue-700 hover:shadow-lg transition duration-300"
          onClick={() => setShowForm(!showForm)}
        >
          {showForm ? 'Đóng form' : '+ Thêm Vùng'}
        </button>

        <div className="relative flex-1 max-w-md">
          <input
            type="text"
            placeholder="Tìm kiếm vùng miền..."
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

      {showForm && (
        <form className="bg-gray-50 p-6 rounded-xl border border-gray-200 mb-8 shadow-sm" onSubmit={handleSubmit}>
          <h3 className="text-xl font-semibold mb-4 text-gray-800">{formData.id ? 'Cập nhật' : 'Thêm mới'} Vùng Miền</h3>
          <div className="flex flex-col sm:flex-row gap-4 items-end">
            <div className="flex-1 w-full">
              <label className="block text-sm font-medium text-gray-700 mb-1">Tên vùng miền</label>
              <input
                type="text"
                name="name"
                placeholder="Nhập tên vùng miền"
                className="w-full px-4 py-2.5 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 disabled:bg-gray-100 disabled:cursor-not-allowed"
                value={formData.name}
                onChange={handleChange}
                required
                disabled={isLoading}
              />
            </div>
            <button type="submit" className="px-6 py-2.5 bg-blue-600 text-white font-medium rounded-lg shadow hover:bg-blue-700 transition w-full sm:w-auto" disabled={isLoading}>
              {isLoading ? "Đang xử lý..." : formData.id ? "Cập nhật" : "Thêm Vùng"}
            </button>
          </div>
        </form>
      )}

      <div className="overflow-x-auto rounded-lg border border-gray-200">
        <table className="min-w-full divide-y divide-gray-200 text-sm text-left">
          <thead className="bg-gray-50 text-gray-600 font-medium">
            <tr>
              <th className="px-4 py-3 w-20">ID</th>
              <th className="px-4 py-3">Tên Vùng Miền</th>
              <th className="px-4 py-3 text-right">Thao tác</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-200 bg-white">
            {regionlist.length > 0 ? regionlist.map((item) => (
              <tr key={item.id} className="hover:bg-gray-50 transition">
                <td className="px-4 py-4 text-gray-500 font-mono">{item.id}</td>
                <td className="px-4 py-4 font-medium text-gray-900">{item.name}</td>
                <td className="px-4 py-4 text-right space-x-2">
                  <button
                    className="text-blue-600 hover:text-blue-900 font-medium"
                    onClick={() => handleEdit(item)}
                    disabled={isLoading}
                  >
                    Sửa
                  </button>
                  <button
                    className="text-red-600 hover:text-red-900 font-medium ml-4"
                    onClick={() => handleDelete(item)}
                    disabled={isLoading}
                  >
                    Xóa
                  </button>
                </td>
              </tr>
            )) : (
              <tr><td colSpan="3" className="px-4 py-8 text-center text-gray-500">Không tìm thấy vùng miền nào.</td></tr>
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

export default Region;
