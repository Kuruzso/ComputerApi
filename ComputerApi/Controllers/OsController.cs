using ComputerApi.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ComputerApi.Controllers
{
    [Route("osystem")]
    [ApiController]
    public class OsController : ControllerBase
    {
        private readonly ComputerContext computerContext;

        public OsController(ComputerContext computerContext)
        {
            this.computerContext = computerContext;
        }
        [HttpPost]
        public async Task<ActionResult<OSystem>> Post(CreateOsDto createOsDto)
        {
            var os = new OSystem
            {
                Id = Guid.NewGuid(),
                Name = createOsDto.Name,
                CreatedTime = DateTime.Now,

            };
            if (os != null)
            {
                await computerContext.Os.AddAsync(os);
                await computerContext.SaveChangesAsync();
                return StatusCode(200, os);
            }
            return BadRequest();
        }
        [HttpGet]
        public async Task<ActionResult<OSystem>> Get() {



            return Ok(await computerContext.Os.ToListAsync());


        }

        [HttpGet("{id}")]
        public async Task<ActionResult<OSystem>> GetById(Guid id)
        {



            var os = await computerContext.Os.FirstOrDefaultAsync(o => o.Id == id);
            if (os != null)
            {
                return Ok(os);
            }
            return StatusCode(404,new {message = "Nincs Találat."});

        }
        [HttpPut("{id}")]
        public async Task<ActionResult<OSystem>> Put(UpdateOsDto updateOsDto, Guid id)
        {

            var existingOs = await computerContext.Os.FirstOrDefaultAsync(o => o.Id == id);

            if (existingOs != null) {
                existingOs.Name =  updateOsDto.Name;
                computerContext.Os.Update(existingOs);
                await computerContext.SaveChangesAsync();
                return Ok(existingOs);
            }
            return NotFound(new {message = "Nincs ilyen" });


        }
        [HttpDelete("{id}")]
        public async Task<ActionResult<OSystem>> Delet(Guid id) {

            var os = await computerContext.Os.FirstOrDefaultAsync(o => o.Id == id);
            if (os != null)
            {
              
                computerContext.Os.Remove(os);
                await computerContext.SaveChangesAsync();
                return Ok(new {message = "Siker" });
            }
            return NotFound(new { message = " nem Siker" });
        }
    }
}
