import React, { useEffect, useState } from "react";
import {
  addBeaches,
  beaches,
  deleteBeache,
  region,
  searchBeaches,
  updateBeaches,
  url,
} from "../../api/function";
import { Editor } from "@tinymce/tinymce-react";
import { toast } from "react-toastify";
import Swal from "sweetalert2";
import Pagination from "../../components/Pagination";

function Beaches() {
  const [listBeaches, setListBeaches] = useState([]);
  const [regionlist, setRegions] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [showForm, setShowForm] = useState(false);
  const [loading, setLoading] = useState(true);
  const [previewImg, setPreviewImg] = useState(null);
  const [search, setSearch] = useState("");
  const [filterRegion, setFilterRegion] = useState("");

  // Pagination state
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);

  const [formData, setFromData] = useState({
    name: "",
    description: "",
    location: "",
    id: null,
    region_id: "",
    latitude: "",
    longitude: "",
    images: [],
  });

  const handleEditorChange = (content) => {
    setFromData({ ...formData, description: content });
  };

  const fetchDataRegion = async () => {
    try {
      const rs = await region(1); // just get first page or configure to get all
      // Assuming region returns non-paginated or we just need the list.
      // If region is also paginated, we might need a separate endpoint to get all regions for the dropdown.
      // For now, let's assume it works or we just use rs.data.data.data if it's paginated.
      const regionData = rs.data?.data?.data ? rs.data?.data?.data : rs.data?.data;
      setRegions(regionData || []);
    } catch (error) {
      console.error(error);
    }
  };

  const fetchData = async (page = 1) => {
    setLoading(true);
    try {
      let rs;
      if (search) {
        rs = await searchBeaches(search, page, filterRegion);
      } else {
        rs = await beaches(page, filterRegion);
      }

      if (rs.data?.data?.data) {
        // Paginated response
        setListBeaches(rs.data.data.data);
        setTotalPages(rs.data.data.last_page);
      } else {
        // Non-paginated fallback
        setListBeaches(rs.data?.data || []);
        setTotalPages(1);
      }
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchDataRegion();
  }, []);

  useEffect(() => {
    fetchData(currentPage);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentPage, filterRegion]);

  const handleChange = (e) => {
    setFromData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const data = new FormData();
    setIsLoading(true);

    formData.images.forEach((file) => {
      if (file instanceof File) {
        data.append("images[]", file);
      } else if (!file.isNew && file.url) {
        data.append("old_images[]", file.url);
      }
    });
    data.append("name", formData.name);
    data.append("description", formData.description);
    data.append("region_id", formData.region_id);
    data.append("location", formData.location);
    data.append("longitude", formData.longitude);
    data.append("latitude", formData.latitude);

    try {
      const method = formData.id !== null ? "PUT" : "POST";
      let rs;
      if (method === "POST") {
        rs = await addBeaches(data);
      } else {
        data.append("_method", "PUT");
        rs = await updateBeaches(data, formData.id);
      }
      fetchData(currentPage);
      toast.success(rs.data?.message);
      setFromData({
        name: "",
        description: "",
        location: "",
        id: null,
        region_id: "",
        latitude: "",
        longitude: "",
        images: [],
      });
      setShowForm(false);
    } catch (error) {
      const errors = error.response?.data?.errors;
      if (errors) {
        Object.values(errors).forEach((errArray) => {
          errArray.forEach((msg) => toast.error(msg));
        });
      } else {
        toast.error("Có lỗi xảy ra, vui lòng thử lại!");
      }
    } finally {
      setIsLoading(false);
    }
  };

  const handleEdit = (value) => {
    const images =
      value.images?.map((img) =>
        img.img_link ? { url: img.img_link } : img
      ) || [];
    setFromData({ ...value, images });
    setShowForm(true);
  };

  const handleDelete = (value) => {
    Swal.fire({
      title: "Are you sure you want to delete?",
      text: "This action cannot be undone.!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "DELETE",
      cancelButtonText: "Cancel",
    }).then(async (result) => {
      if (result.isConfirmed) {
        try {
          await deleteBeache(value.id);
          Swal.fire("Deleted!", "Data has been deleted.", "success");
          fetchData(currentPage);
        } catch (error) {
          Swal.fire("Failed!", "Delete failed, please try again.", "error");
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

  if (loading && listBeaches.length === 0) return <p>⏳ Đang tải dữ liệu...</p>;

  return (
    <div className="bg-white p-6 rounded-lg shadow-sm">
      <div className="flex items-center gap-3 mb-6">
        <button
          type="button"
          className="px-5 py-2.5 rounded-lg bg-blue-600 text-white font-medium shadow-md hover:bg-blue-700 hover:shadow-lg transition duration-300"
          onClick={() => setShowForm(!showForm)}
        >
          {showForm ? 'Đóng form' : '+ Thêm Bãi Biển'}
        </button>
        <div className="relative flex-1 max-w-md">
          <input
            type="text"
            placeholder="Tìm kiếm bãi biển..."
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

        <div className="relative w-48">
          <select
            className="w-full px-4 py-2.5 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 shadow-sm transition appearance-none bg-white text-gray-700"
            value={filterRegion}
            onChange={(e) => {
              setFilterRegion(e.target.value);
              setCurrentPage(1);
            }}
          >
            <option value="">Tất cả Vùng miền</option>
            {regionlist.map((item) => (
              <option key={item.id} value={item.id}>{item.name}</option>
            ))}
          </select>
          <div className="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-500">
            <svg className="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" /></svg>
          </div>
        </div>

        <button
          onClick={handleSearch}
          className="px-4 py-2.5 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200 transition font-medium"
        >
          Tìm kiếm
        </button>
      </div>

      {showForm && (
        <form onSubmit={handleSubmit} className="bg-gray-50 p-6 rounded-xl border border-gray-200 mb-8 shadow-sm">
          <h3 className="text-xl font-semibold mb-4 text-gray-800">{formData.id ? 'Cập nhật' : 'Thêm mới'} Bãi Biển</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
            <input
              type="text"
              name="name"
              placeholder="Tên bãi biển"
              className="w-full px-4 py-2.5 border border-gray-300 rounded-lg shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              value={formData.name}
              onChange={handleChange}
              required
              disabled={isLoading}
            />
            <input
              type="text"
              name="location"
              placeholder="Vị trí / Địa chỉ"
              className="w-full px-4 py-2.5 border border-gray-300 rounded-lg shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              value={formData.location}
              onChange={handleChange}
              required
              disabled={isLoading}
            />
            <input
              type="text"
              name="longitude"
              placeholder="Kinh độ (Longitude)"
              className="w-full px-4 py-2.5 border border-gray-300 rounded-lg shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              value={formData.longitude}
              onChange={handleChange}
              required
              disabled={isLoading}
            />
            <input
              type="text"
              name="latitude"
              placeholder="Vĩ độ (Latitude)"
              className="w-full px-4 py-2.5 border border-gray-300 rounded-lg shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              value={formData.latitude}
              onChange={handleChange}
              required
              disabled={isLoading}
            />
            <select
              name="region_id"
              value={formData.region_id}
              onChange={handleChange}
              className="w-full px-4 py-2.5 border border-gray-300 rounded-lg shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              disabled={isLoading}
              required
            >
              <option value="">-- Chọn vùng miền --</option>
              {regionlist.map((item) => (
                <option key={item.id} value={item.id}>{item.name}</option>
              ))}
            </select>
          </div>

          <div className="mb-4">
            <Editor
              apiKey="h9m4zl3z71i528wkvqa05goi539oxxpr2prkmoenfonsfbzg"
              value={formData.description}
              init={{
                height: 300,
                menubar: false,
                plugins: "lists link image code",
                toolbar: "undo redo | formatselect | bold italic | alignleft aligncenter alignright | bullist numlist | link blockquote",
              }}
              onEditorChange={handleEditorChange}
            />
          </div>

          <div className="mb-6">
            <label className="inline-flex items-center px-4 py-2 bg-blue-50 text-blue-700 font-medium rounded-lg border border-blue-200 cursor-pointer hover:bg-blue-100 transition">
              <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
              Chọn hình ảnh
              <input
                type="file"
                accept="image/*"
                multiple
                onChange={(e) => setFromData({ ...formData, images: [...formData.images, ...Array.from(e.target.files)] })}
                className="hidden"
              />
            </label>

            <div className="flex gap-3 flex-wrap mt-4">
              {formData.images.map((file, index) => {
                let src = file instanceof File ? URL.createObjectURL(file) : (file.url?.startsWith("http") ? file.url : url + file.url);
                return (
                  <div key={index} className="relative group rounded-lg overflow-hidden border shadow-sm">
                    <img src={src} alt="preview" className="w-24 h-24 object-cover" />
                    <button
                      type="button"
                      onClick={() => setFromData({ ...formData, images: formData.images.filter((_, i) => i !== index) })}
                      className="absolute inset-0 bg-black bg-opacity-50 text-white flex items-center justify-center opacity-0 group-hover:opacity-100 transition"
                    >
                      <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                    </button>
                  </div>
                );
              })}
            </div>
          </div>

          <button type="submit" className="px-6 py-2.5 bg-blue-600 text-white font-medium rounded-lg shadow hover:bg-blue-700 transition w-full md:w-auto" disabled={isLoading}>
            {isLoading ? "Đang xử lý..." : formData.id ? "Cập nhật Bãi Biển" : "Lưu Bãi Biển"}
          </button>
        </form>
      )}

      <div className="overflow-x-auto rounded-lg border border-gray-200">
        <table className="min-w-full divide-y divide-gray-200 text-sm text-left">
          <thead className="bg-gray-50 text-gray-600 font-medium">
            <tr>
              <th className="px-4 py-3">Tên / Vị trí</th>
              <th className="px-4 py-3">Vùng</th>
              <th className="px-4 py-3 hidden md:table-cell">Tọa độ</th>
              <th className="px-4 py-3">Mô tả</th>
              <th className="px-4 py-3">Hiển thị</th>
              <th className="px-4 py-3 text-right">Thao tác</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-200 bg-white">
            {listBeaches.length > 0 ? listBeaches.map((item) => (
              <tr key={item.id} className="hover:bg-gray-50 transition">
                <td className="px-4 py-4">
                  <div className="font-semibold text-gray-900">{item.name}</div>
                  <div className="text-gray-500 text-xs mt-1">{item.location}</div>
                </td>
                <td className="px-4 py-4"><span className="px-2.5 py-1 bg-blue-50 text-blue-700 rounded-full text-xs font-medium">{item.region?.name}</span></td>
                <td className="px-4 py-4 hidden md:table-cell text-gray-500">
                  <div>Lat: {item.latitude}</div>
                  <div>Lng: {item.longitude}</div>
                </td>
                <td className="px-4 py-4">
                  <div className="max-w-xs text-xs text-gray-500 line-clamp-2" dangerouslySetInnerHTML={{ __html: item.description }} />
                </td>
                <td className="px-4 py-4">
                  <div className="flex -space-x-2 overflow-hidden">
                    {item.images?.slice(0, 3).map((img, index) => (
                      <img
                        key={index}
                        src={img.img_link?.startsWith('http') ? img.img_link : `${url}${img.img_link}`}
                        alt={item.name}
                        onClick={() => setPreviewImg(img.img_link?.startsWith('http') ? img.img_link : url + img.img_link)}
                        className="inline-block h-10 w-10 object-cover rounded-full ring-2 ring-white cursor-pointer hover:z-10 transform hover:scale-110 transition"
                      />
                    ))}
                    {item.images?.length > 3 && (
                      <div className="inline-flex items-center justify-center w-10 h-10 rounded-full bg-gray-100 text-xs font-medium text-gray-600 ring-2 ring-white">
                        +{item.images.length - 3}
                      </div>
                    )}
                  </div>
                </td>
                <td className="px-4 py-4 text-right space-x-2">
                  <button className="text-blue-600 hover:text-blue-900 font-medium" onClick={() => handleEdit(item)} disabled={isLoading}>Sửa</button>
                  <button className="text-red-600 hover:text-red-900 font-medium" onClick={() => handleDelete(item)} disabled={isLoading}>Xóa</button>
                </td>
              </tr>
            )) : (
              <tr><td colSpan="6" className="px-4 py-8 text-center text-gray-500">Không tìm thấy dữ liệu.</td></tr>
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

      {previewImg && (
        <div className="fixed inset-0 bg-black bg-opacity-80 flex items-center justify-center z-50 p-4" onClick={() => setPreviewImg(null)}>
          <div className="relative max-w-4xl w-full" onClick={e => e.stopPropagation()}>
            <button
              onClick={() => setPreviewImg(null)}
              className="absolute -top-12 right-0 text-white hover:text-gray-300 transition"
            >
              <svg className="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12"></path></svg>
            </button>
            <img src={previewImg} alt="preview" className="w-full h-auto max-h-[85vh] object-contain rounded-lg shadow-2xl" />
          </div>
        </div>
      )}
    </div>
  );
}

export default Beaches;
